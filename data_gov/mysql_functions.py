import mysql.connector
from typing import List


class MySQLConnector:
    def __init__(
        self,
        username: str,
        password: str,
        host: str,
        database_name: str,
        table_name: str,
    ):
        self.username = username
        self.password = password
        self.host = host
        self.database_name = database_name
        self.table_name = table_name

    def insert_data(self, data_list: List[dict]) -> int:
        """Insert data to a MySQL table.

        Args:
            data_list (List[dict]): List of data from data.gov.gr response to insert.

        Returns:
            int: Number of rows inserted.
        """
        try:
            cnx = mysql.connector.connect(
                user=self.username,
                password=self.password,
                host=self.host,
                database=self.database_name,
                port=3306,
            )
        except mysql.connector.Error as err:
            print(f"MySQL Error: {err}")
            raise (err)
        cursor = cnx.cursor()
        placeholders = ", ".join(["%s"] * len(data_list[0]))
        columns = ", ".join(data_list[0].keys())
        sql = (
            f"INSERT IGNORE INTO {self.table_name} ({columns}) VALUES ({placeholders})"
        )
        values = [tuple(d.values()) for d in data_list]
        cursor.executemany(sql, values)
        rows_inserted = cursor.rowcount
        cnx.commit()
        cnx.close()
        return rows_inserted
