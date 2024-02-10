import argparse
import orjson
import asyncio
from typing import List, Any
from mysql_functions import MySQLConnector
from datetime import datetime, timedelta
from aiohttp import ClientSession


def construct_url(endpoint: str, date_from: str, date_to: str) -> str:
    """Format the URL for querying according to specified dates

    Args:
        endpoint (str): Endpoint to query
        date_from (str): Starting date in format YYYY-DD-MM
        date_to (str): Ending date in format YYYY-DD-MM

    Returns:
        str: The formatted URL
    """
    return f"https://data.gov.gr/api/v1/query/{endpoint}?date_from={date_from}&date_to={date_to}"


async def query_endpoint(
    url: str,
    token: str,
    session: ClientSession,
    retries: int = 10,
    sleep_seconds: int = 5,
) -> List[dict]:
    """Query the data.gov.gr API for the specified interval, in async fashion

    Args:
        url (str): Constructed url to query
        token (str): User token for authentication
        session (ClientSession): aiohttp session for querying
        retries (int): Number of retries in case of failure
        sleep_seconds (int): How many seconds to sleep between requests

    Raises:
        Exception: Any exception raised from the data.gov.gr backend after all retries

    Returns:
        List[dict]: List of dicts containing the data (varies according to endpoint)
    """
    headers = {"Authorization": f"Token {token}"}
    for _ in range(retries):
        try:
            async with session.get(url, headers=headers) as response:
                if response.status != 200:
                    raise Exception(f"Request failed with status {response.status}")

                content = await response.read()

                loop = asyncio.get_event_loop()
                data = await loop.run_in_executor(None, orjson.loads, content)
                return data
        except Exception as e:
            print(f"Error querying gov.gr endpoint: {e}, retrying...")
            await asyncio.sleep(sleep_seconds)

    # If we've reached this point, all retries have failed.
    raise Exception(f"Failed to query {url} after {retries} attempts")


def parse_arguments() -> argparse.Namespace:
    """Parse arguments from the command line

    Returns:
        argparse.Namespace: _description_
    """
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--token", help="Data GOV token to use for authenticating", required=True
    )
    parser.add_argument(
        "--dataset",
        help="Dataset to query",
        choices=["mdg_emvolio", "oasa_ridership"],
        required=True,
    )
    parser.add_argument(
        "--sleep-seconds",
        type=int,
        dest="sleep_seconds",
        help="How many seconds to sleep between each async request",
    )
    parser.add_argument(
        "--max-requests",
        type=int,
        dest="max_requests",
        help="Number of concurrent async requests to send",
    )
    parser.add_argument(
        "--interval-days",
        type=int,
        dest="interval_days",
        help="Number of days to use for splitting the datetime interval in chunks",
    )
    parser.add_argument(
        "--table-name",
        help="MariaDB table name to insert the GOV Data to",
        required=True,
    )
    parser.add_argument(
        "--mysql-host", help="MySQL host (e.g. localhost or IP)", required=True
    )
    parser.add_argument(
        "--mysql-user", help="MySQL user to authenticate", required=True
    )
    parser.add_argument(
        "--mysql-password", help="MySQL password for authentication", required=True
    )
    parser.add_argument(
        "--mysql-database", help="MySQL database to connect to", required=True
    )
    parser.add_argument(
        "--date-from", help="Start date for the query in YYYY-MM-DD", required=True
    )
    parser.add_argument(
        "--date-to", help="End date for the query in YYYY-MM-DD", required=True
    )
    return parser.parse_args()


def create_date_intervals(
    date_from: str, date_to: str, interval_days: int = 7
) -> List[tuple]:
    """Given two dates, generate intervals to use with async requests.

    Args:
        date_from (str): Starting date to start splitting.
        date_to (str): End date to stop splitting.
        interval_days (int): Number of days to use to split interval in chunks.

    Returns:
        List[tuple]: List of date intervals.
    """
    date_from = datetime.strptime(date_from, "%Y-%m-%d")
    date_to = datetime.strptime(date_to, "%Y-%m-%d")
    intervals = [
        (
            date_from + timedelta(days=i),
            min(date_from + timedelta(days=i + interval_days - 1), date_to),
        )
        for i in range(0, (date_to - date_from).days + 1, interval_days)
    ]
    return intervals


async def main():
    """Driver function."""
    args = parse_arguments()
    date_intervals = create_date_intervals(
        args.date_from, args.date_to, args.interval_days
    )

    async with ClientSession() as session:
        tasks = []
        for date_interval in date_intervals:
            url = construct_url(
                args.dataset,
                date_interval[0].strftime("%Y-%m-%d"),
                date_interval[1].strftime("%Y-%m-%d"),
            )
            tasks.append(query_endpoint(url, args.token, session))
            if len(tasks) >= args.max_requests:
                responses = await gather_responses(tasks)
                tasks = []
                process_responses(responses, args)
                # Wait to avoid stressing the backend too much
                await asyncio.sleep(args.sleep_seconds)
        if tasks:
            responses = await gather_responses(tasks)
            process_responses(responses, args)


async def gather_responses(tasks: List[asyncio.Task]) -> List[Any]:
    """Collect backend responses.

    Args:
        tasks (list): List of asyncio Tasks representing the API requests.

    Returns:
        List[Any]: List of responses from the backend. Each response can be a list of data or an error message.
    """
    responses = []
    for task in asyncio.as_completed(tasks):
        try:
            response = await task
            responses.append(response)
        except Exception as e:
            print(f"Error querying gov.gr endpoint: {e}")
    return responses


def process_responses(responses: List[Any], args: argparse.Namespace) -> None:
    """Process responses and insert data into the database.

    Args:
        responses (List[Any]): List of responses from the backend. Each response can be a list of data or an error message.
        args (Namespace): Parsed command-line arguments.
    """
    mysql_interface = MySQLConnector(
        args.mysql_user,
        args.mysql_password,
        args.mysql_host,
        args.mysql_database,
        args.table_name,
    )
    for response in responses:
        if isinstance(response, list) and response:
            rows_inserted = mysql_interface.insert_data(response)
            print(f"Inserted {rows_inserted} new records to MySQL")


if __name__ == "__main__":
    asyncio.run(main())
