from unittest.mock import patch, MagicMock
from data_gov.mysql_functions import MySQLConnector 

@patch('mysql.connector.connect')
def test_get_existing_keys(mock_connect):
    mock_cursor = MagicMock()
    mock_connect.return_value.cursor.return_value = mock_cursor
    mock_cursor.fetchall.return_value = [('key1',), ('key2',)]
    connector = MySQLConnector("username", "password", "host", "database", "table", ["field1", "field2"], "key_column")
    keys = connector.get_existing_keys()
    assert keys == {'key1', 'key2'}

def test_construct_unique_key():
    connector = MySQLConnector("username", "password", "host", "database", "table", ["field1", "field2"], "key_column")
    data_dict = {"field1": "value1", "field2": "value2", "other_field": "other_value"}
    key = connector.construct_unique_key(data_dict)
    assert key == "value1_value2"

@patch('mysql.connector.connect')
def test_insert_data(mock_connect):
    mock_cursor = MagicMock()
    mock_connect.return_value.cursor.return_value = mock_cursor
    mock_cursor.rowcount = 1
    connector = MySQLConnector("username", "password", "host", "database", "table", ["field1", "field2"], "key_column")
    connector.existing_keys = set()
    rows_inserted = connector.insert_data([{"field1": "value1", "field2": "value2"}])
    assert rows_inserted == 1