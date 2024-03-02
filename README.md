# data-gov-project
This is a Python application that fetches data from the [data.gov.gr repository](https://data.gov.gr/search/) using its API and inserts them to a **MySQL** database for further analysis. A working end-to-end example with the [COVID-19 Vaccination data](https://data.gov.gr/datasets/mdg_emvolio/) is provided.
# How to use

## Command line
`python3.12 data_gov.py --token YOUR_TOKEN --dataset mdg_emvolio --table-name CovidVaccinationData --mysql-host HOST_NAME --mysql-user MYSQL_USER --mysql-password MYSQL_PASSWORD --mysql-database MYSQL_DATABASE --date-from YYYY-MM-DD --date-to YYYY-MM-DD --sleep-seconds SLEEP_SECONDS --interval-days INTERVAL_DAYS --max-requests MAX_REQUESTS`
## Token
Register here for a token: [data.gov.gr page](https://www.data.gov.gr/token/)
## Docker 
The application can be containerized via the `docker-compose` file included. There are 3 containers:
- `dockerfile.python`: Dockerizes the Python application and runs the `entrypoint.sh` script for initialization. 
- `db`: Runs the latest MySQL Docker image. Uses the `init.sql` script for initialization. 
- `metabase`: Runs the latest Metabase Docker image.

Prepare an `.env` file with the following structure (modify accordingly):
```
MYSQL_ROOT_PASSWORD=your_root_password
MYSQL_DATABASE=data_gov
TOKEN=your_gov_token
DATASET=mdg_emvolio
TABLE_NAME=CovidVaccinationData
TABLE_KEY_COLUMN=unique_id
MYSQL_HOST=db
MYSQL_USER=data_gov
MYSQL_PASSWORD=datagovsqlpassword
DATE_FROM=YYYY-DD-MM
DATE_TO=YYYY-DD-MM
MAX_REQUESTS = 2
INTERVAL_DAYS = 7
SLEEP_SECONDS = 5
```
Build the Python dockerfile: `docker build -t data-gov-python -f dockerfile.python`. Modify the `docker-compose.yaml` and the `init.sql` files according to your needs, then run `docker-compose up --env-file .env`.
## Configurations
### .env
This is the environment file that controls the variables that will be used for the docker containers (mainly the Python and SQL one). 
### init.sql
This is the script that will be run on startup from the MySQL Docker container. It can be used to preconfigure the users, passwords, tables etc. 
### entrypoint.sh
This shell script is executed from the Python Docker container. It runs the Python script with the command line arguments provided.
### Metabase
After all containers are up and running, Metabase can be accessed at `http://localhost:3000`. It requires an initial setup. For connecting to the MySQL database, this should be added to the connection string: `allowPublicKeyRetrieval=true`
# Remarks
1. Backend can struggle to serve multiple requests, thus a conservative approach is used (2 async tasks, 10 seconds sleep interval).
2. Most datasets are small in size and there are no performance issues with this simple setup. However datasets like `oasa_ridership` are larger, and performance/RAM requirements start to suffer. An architecture/application rewrite is planned to ensure scalability across all datasets.

# Extracting insights
![metabase dashboard](https://github.com/ikeratzakis/data-gov/blob/main/metabase_dashboard.png)

## Example SQL Queries
```
SELECT subquery.date, SUM(subquery.max_totaldistinctpersons) as total_max_totaldistinctpersons
FROM (
    SELECT DATE(referencedate) as date, area, MAX(totaldistinctpersons) as max_totaldistinctpersons
    FROM data_gov.covid_vaccination_data
    GROUP BY date, area
) as subquery
GROUP BY subquery.date;
```

# Normalizing the schema
There is a lot of data duplication on table groups like the ktm_, minedu ones. These can be normalized to a more efficient schema (WIP)

# Data management
After the data have been imported to the MySQL database, they can be exported to CSV and then dumped to a more efficient database for analytics, like a dedicated time series database (e.g. InfluxDB) or a columnar database (e.g. Clickhouse).
Alternatively, to facilitate this, a pipeline that selects records based on the DATE columns can be used, to migrate the data to another system for daily consumption. However, in general the datasets are small enough that a regular RDBMS can also work.