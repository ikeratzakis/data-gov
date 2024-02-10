from unittest.mock import patch, MagicMock
from data_gov.mysql_functions import MySQLConnector


@patch("mysql.connector.connect")
def test_insert_data(mock_connect):
    mock_cursor = MagicMock()
    mock_connect.return_value.cursor.return_value = mock_cursor
    mock_cursor.rowcount = 1
    connector = MySQLConnector(
        "username",
        "password",
        "host",
        "database",
        "table",
    )
    connector.existing_keys = set()
    rows_inserted = connector.insert_data([{"field1": "value1", "field2": "value2"}])
    assert rows_inserted == 1
