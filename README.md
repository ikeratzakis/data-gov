# data-gov-project
This is a Python application that fetches data from the [data.gov.gr repository](https://data.gov.gr/search/) using its API and inserts them to a **MySQL** database for further analysis. A working end-to-end example with the [COVID-19 Vaccination data](https://data.gov.gr/datasets/mdg_emvolio/) is provided.
# How to use
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
```
Build the Python dockerfile: `docker build -t data-gov-python -f dockerfile.python`. Modify the `docker-compose.yaml` and the `init.sql` files according to your needs, then run `docker-compose up --env-file .env`.
## Configurations
### .env
This is the environment file that controls the variables that will be used for the docker containers (mainly the Python and SQL one). 
### init.sql
This is the script that will be run on startup from the MySQL Docker container. It can be used to preconfigure the users, passwords, tables etc. 
### entrypoint.sh
This shell script is executed from the Python Docker container. It runs the Python script with the command line arguments provided.
### Python script
Adding `--crawl-mode` (or CRAWL_MODE to the .env file) launches the Python script in crawl mode, where once a day data is fetched from the data.gov API for the chosen endpoint. 
### Metabase
After all containers are up and running, Metabase can be accessed at `http://localhost:3000`. It requires an initial setup. For connecting to the MySQL database, this should be added to the connection string: `allowPublicKeyRetrieval=true`
# Remarks
1. Unfortunately, the API has practically zero documentation. The only provided endpoint from each dataset allows only batch querying of data (for all dates), thus inside the code a key is constructed from the records to have a way to compare with the inserted ones
2. Most datasets are small in size and there are no performance issues with a simple setup
3. Many dataset endpoints return a "window exceeded" response - this can vary over time. This is related to the first issue
# Extracting insights
![metabase dashboard](https://github.com/ikeratzakis/data-gov/blob/main/metabase_dashboard.png)

## Example SQL Queries
```
SELECT subquery.date, SUM(subquery.max_totaldistinctpersons) as total_max_totaldistinctpersons
FROM (
    SELECT DATE(referencedate) as date, area, MAX(totaldistinctpersons) as max_totaldistinctpersons
    FROM data_gov.CovidVaccinationData
    GROUP BY date, area
) as subquery
GROUP BY subquery.date;
```

