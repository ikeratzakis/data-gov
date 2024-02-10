-- Runs when the MySQL docker first starts, modify accordingly to your needs
CREATE DATABASE IF NOT EXISTS data_gov;

USE data_gov;

CREATE TABLE IF NOT EXISTS data_gov.CovidVaccinationData(
    area VARCHAR(255),
    areaid INT,
    dailydose1 INT,
    dailydose2 INT,
    dailydose3 INT,
    daydiff INT,
    daytotal INT,
    referencedate DATETIME,
    totaldistinctpersons INT,
    totaldose1 INT,
    totaldose2 INT,
    totaldose3 INT,
    totalvaccinations INT,
    PRIMARY KEY (areaid, referencedate)
);

CREATE TABLE IF NOT EXISTS data_gov.OasaRidership(
    date_hour DATETIME,
    dv_agency VARCHAR(255),
    dv_platenum_station VARCHAR(255),
    dv_route TEXT,
    dv_validations INT,
    load_dt DATETIME,
    routes_per_hour INT,
    PRIMARY KEY (date_hour, dv_platenum_station)
);

-- Users to connect with, modify accordingly
CREATE USER IF NOT EXISTS 'metabase' @'%' IDENTIFIED BY 'metabasesqlpassword';

CREATE USER IF NOT EXISTS 'data_gov' @'%' IDENTIFIED BY 'datagovsqlpassword';

GRANT
SELECT
    ON data_gov.* TO 'metabase' @'%';

GRANT ALL ON data_gov.* TO 'data_gov' @'%';

FLUSH PRIVILEGES;