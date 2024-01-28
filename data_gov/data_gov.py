import argparse
import requests
import orjson
import os 
import time
from typing import List, Union
from mysql_functions import MySQLConnector

KEY_FIELDS_MAPPING = {"mdg_emvolio": ["areaid", "referencedate"]}


def construct_url(endpoint: str) -> str:
    return f"https://data.gov.gr/api/v1/query/{endpoint}"


def query_endpoint(url: str, token: str) -> Union[List[dict], str]:
    headers = {"Authorization": f"Token {token}"}
    response = None

    try:
        response = requests.get(url, headers=headers)
        response.raise_for_status()
    except requests.exceptions.HTTPError as errh:
        return f"HTTP Error: {errh}"
    except requests.exceptions.ConnectionError as errc:
        return f"Error Connecting: {errc}"
    except requests.exceptions.Timeout as errt:
        return f"Timeout Error: {errt}"
    except requests.exceptions.RequestException as err:
        return f"Error: {err}"

    try:
        data = orjson.loads(response.content)
    except orjson.JSONDecodeError as e:
        return f"JSON decode error: {e}"

    return data


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--token", help="Data GOV token to use for authenticating", required=True)
    parser.add_argument("--dataset", help="Dataset to query",
                        choices=["mdg_emvolio"], required=True)
    parser.add_argument("--table-name", help="MariaDB table name to insert the GOV Data to", required=True)
    parser.add_argument(
        "--table-key-column", help="Table key column to use to identify record", required=True)
    parser.add_argument(
        "--mysql-host", help="MySQL host (e.g. localhost or IP)", required=True)
    parser.add_argument(
        "--mysql-user", help="MySQL user to authenticate", required=True)
    parser.add_argument(
        "--mysql-password", help="MySQL password for authentication", required=True)
    parser.add_argument("--mysql-database",
                        help="MySQL database to connect to", required=True)
    parser.add_argument("--crawl-mode", help="If provided, app will stay open and check once a day for updates")
    args = parser.parse_args()

    url = construct_url(args.dataset)
    response = query_endpoint(url, args.token)

    while True:
        if type(response) == list:
            # Got correct response, insert to database
            mysql_interface = MySQLConnector(args.mysql_user, args.mysql_password, args.mysql_host, args.mysql_database,
                                                args.table_name, key_fields=KEY_FIELDS_MAPPING[args.dataset], table_key_column=args.table_key_column)
            rows_inserted = mysql_interface.insert_data_multiprocessing(response, os.cpu_count(), 1000)
            print(f"Inserted {rows_inserted} new rows to {args.table_name}")
            if args.crawl_mode:
                time.sleep(86400)
            else:
                break

if __name__ == "__main__":
    main()
