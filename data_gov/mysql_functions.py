import mysql.connector
from multiprocessing import Pool
from typing import List

class MySQLConnector:
    def __init__(self, username: str, password: str, host: str, database_name: str, table_name: str, key_fields: List[str], table_key_column: str):
        self.username = username
        self.password = password
        self.host = host
        self.database_name = database_name
        self.table_name = table_name
        self.key_fields = key_fields
        self.table_key_column = table_key_column

    def get_existing_keys(self) -> set:
        try:
            cnx = mysql.connector.connect(user=self.username, password=self.password, host=self.host, database=self.database_name, port=3306)
        except mysql.connector.Error as err:
            print(f"MySQL Error: {err}")
            raise(err)
        
        cursor = cnx.cursor()
        cursor.execute(f"SELECT {self.table_key_column} FROM {self.table_name}")
        keys = {row[0] for row in cursor.fetchall()}
        cnx.close()
        return keys

    def construct_unique_key(self, data_dict: dict) -> str:
        return "_".join(str(data_dict[field]) for field in self.key_fields)

    def insert_data(self, data_list: List[dict]) -> int:
        try:
            cnx = mysql.connector.connect(user=self.username, password=self.password, host=self.host, database=self.database_name, port=3306)
        except mysql.connector.Error as err:
            print(f"MySQL Error: {err}")
            raise(err)
        cursor = cnx.cursor()
        placeholders = '%s, ' + ', '.join(['%s'] * len(data_list[0]))
        columns = f"{self.table_key_column}, " + ', '.join(data_list[0].keys())
        sql = f"INSERT IGNORE INTO {self.table_name} ({columns}) VALUES ({placeholders})"
        values = [(self.construct_unique_key(d),) + tuple(d.values()) for d in data_list if self.construct_unique_key(d) not in self.existing_keys]
        cursor.executemany(sql, values)
        rows_inserted = cursor.rowcount
        cnx.commit()
        cnx.close()
        return rows_inserted

    def insert_data_multiprocessing(self, data_list: List[dict], num_processes: int, chunk_size: int) -> int:
        self.existing_keys = self.get_existing_keys()
        with Pool(processes=num_processes) as pool:
            chunks = [data_list[i:i+chunk_size] for i in range(0, len(data_list), chunk_size)]
            results = pool.map(self.insert_data, chunks)
            total_rows_inserted = max(sum(results), 0)
        return total_rows_inserted

