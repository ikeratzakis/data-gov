import psycopg
from psycopg import sql
from typing import List


class PostgreSQLConnector:
    def __init__(
        self,
        username: str,
        password: str,
        host: str,
        database_name: str,
        table_name: str,
        schema:str
    ):
        self.username = username
        self.password = password
        self.host = host
        self.database_name = database_name
        self.table_name = table_name
        self.schema = schema

    def insert_data(self, data_list: List[dict]) -> int:
        """Insert data to a PostgreSQL table.

        Args:
            data_list (List[dict]): List of data to insert.

        Returns:
            int: Number of rows inserted.
        """
        try:
            cnx = psycopg.connect(
                user=self.username,
                password=self.password,
                host=self.host,
                dbname=self.database_name,
                port=5432,
            )
        except psycopg.Error as err:
            print(f"PostgreSQL Error: {err}")
            raise (err)
        cursor = cnx.cursor()
        placeholders = ", ".join(["%s"] * len(data_list[0]))
        columns = ", ".join(data_list[0].keys())
        insert_query = sql.SQL(
            f"INSERT INTO {self.schema}.{self.table_name} ({columns}) VALUES ({placeholders}) ON CONFLICT DO NOTHING"
        )
        values = [tuple(d.values()) for d in data_list]
        cursor.executemany(insert_query, values)
        rows_inserted = cursor.rowcount
        cnx.commit()
        cnx.close()
        return rows_inserted