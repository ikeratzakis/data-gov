import requests_mock
from data_gov.data_gov import construct_url, query_endpoint

def test_construct_url():
    endpoint = "mdg_emvolio"
    expected_url = "https://data.gov.gr/api/v1/query/mdg_emvolio"
    assert construct_url(endpoint) == expected_url

def test_query_endpoint_success(requests_mock):
    mock_url = "https://data.gov.gr/api/v1/query/mdg_emvolio"
    mock_data = [{"areaid": "123", "referencedate": "2024-01-26"}]
    requests_mock.get(mock_url, json=mock_data)
    token = 'test_token'  # replace with your token
    assert query_endpoint(mock_url, token) == mock_data

def test_query_endpoint_http_error(requests_mock):
    mock_url = "https://data.gov.gr/api/v1/query/mdg_emvolio"
    requests_mock.get(mock_url, status_code=500)
    token = "test_token"  # replace with your token
    assert "HTTP Error" in query_endpoint(mock_url, token)
