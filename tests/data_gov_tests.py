import requests_mock
import asyncio
import pytest
from datetime import datetime
from aiohttp import ClientSession
from unittest.mock import Mock, patch
from data_gov.data_gov import construct_url, query_endpoint, create_date_intervals


def test_construct_url():
    endpoint = "test_endpoint"
    date_from = "2024-01-01"
    date_to = "2024-12-31"
    expected_url = f"https://data.gov.gr/api/v1/query/{endpoint}?date_from={date_from}&date_to={date_to}"
    assert construct_url(endpoint, date_from, date_to) == expected_url


@patch("data_gov.data_gov.orjson.loads")
@patch("data_gov.data_gov.asyncio.sleep", return_value=None)
@patch("data_gov.data_gov.asyncio.get_event_loop")
@patch("aiohttp.ClientSession.get")
@pytest.mark.asyncio
async def test_query_endpoint(mock_get, mock_loop, mock_sleep, mock_orjson):
    url = "https://data.gov.gr/api/v1/query/test_endpoint?date_from=2024-01-01&date_to=2024-12-31"
    token = "test_token"
    session = ClientSession()
    retries = 3

    # Mock the response from the GET request
    mock_response = Mock()
    mock_response.status = 200
    mock_response.read.return_value = asyncio.Future()
    mock_response.read.return_value.set_result(b'{"key": "value"}')
    mock_get.return_value.__aenter__.return_value = mock_response

    # Mock the event loop
    future = asyncio.Future()
    future.set_result({"key": "value"})
    mock_loop.return_value.run_in_executor.return_value = future

    # Mock the JSON parsing
    mock_orjson.return_value = {"key": "value"}

    result = await query_endpoint(url, token, session, retries)
    assert result == {"key": "value"}


def test_create_date_intervals():
    date_from = "2024-01-01"
    date_to = "2024-01-11"
    # Example for 7 interval days
    expected_intervals = [
        (
            datetime.strptime("2024-01-01", "%Y-%m-%d"),
            datetime.strptime("2024-01-07", "%Y-%m-%d"),
        ),
        (
            datetime.strptime("2024-01-08", "%Y-%m-%d"),
            datetime.strptime("2024-01-11", "%Y-%m-%d"),
        ),
    ]
    assert create_date_intervals(date_from, date_to) == expected_intervals
