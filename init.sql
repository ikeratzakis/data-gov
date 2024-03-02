-- Runs when the MySQL docker first starts, modify accordingly to your needs
CREATE DATABASE IF NOT EXISTS data_gov;

USE data_gov;

CREATE TABLE IF NOT EXISTS data_gov.covid_vaccination_data(
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

CREATE TABLE IF NOT EXISTS data_gov.oasa_ridership(
    date_hour DATETIME,
    dv_agency VARCHAR(255),
    dv_platenum_station VARCHAR(255),
    dv_route TEXT,
    dv_validations INT,
    load_dt DATETIME,
    routes_per_hour INT,
    PRIMARY KEY (date_hour, dv_platenum_station)
);

CREATE TABLE IF NOT EXISTS data_gov.road_traffic_attica(
    appprocesstime DATETIME,
    average_speed FLOAT,
    countedcars INT,
    deviceid VARCHAR(255),
    road_info VARCHAR(255),
    road_name VARCHAR(255),
    PRIMARY KEY (appprocesstime, deviceid)
);

CREATE TABLE IF NOT EXISTS data_gov.sailing_traffic(
    arrivalport VARCHAR(255),
    arrivalportname VARCHAR(255),
    date DATETIME,
    departureport VARCHAR(255),
    departureportname VARCHAR(255),
    passengercount INT,
    routecode VARCHAR(255),
    routecodenames VARCHAR(255),
    vehiclecount INT,
    PRIMARY KEY (date, departureport, arrivalport)
);

CREATE TABLE IF NOT EXISTS prisons_occupancy(
    adults INT,
    date DATETIME,
    juveniles INT,
    prison VARCHAR(255),
    total INT,
    young_adults INT,
    PRIMARY KEY (date, prison)
);

CREATE TABLE IF NOT EXISTS prisons_capacity(
    area FLOAT,
    date DATETIME,
    farmers_capacity INT,
    female_capacity INT,
    juvenile_capacity INT,
    male_capacity INT,
    net_capacity INT,
    percent_capacity FLOAT,
    prison VARCHAR(255),
    prisoners INT,
    rehab_capacity INT,
    total_capacity INT,
    young_adults_capacity INT,
    PRIMARY KEY(date, prison)
);

CREATE TABLE IF NOT EXISTS mcp_traffic_violations(
    count INT,
    violation VARCHAR(255),
    year YEAR,
    PRIMARY KEY(violation, year)
);

CREATE TABLE IF NOT EXISTS mcp_traffic_accidents(
    deadly_accidents INT,
    deaths INT,
    jurisdiction VARCHAR(255),
    other_accidents INT,
    other_injured INT,
    serious_accidents INT,
    seriously_injured INT,
    year YEAR,
    PRIMARY KEY(jurisdiction, year)
);

CREATE TABLE IF NOT EXISTS mcp_crime(
    attempted INT,
    committed INT,
    crime VARCHAR(255),
    domestic_criminals INT,
    foreign_criminals INT,
    solved INT,
    year YEAR,
    PRIMARY KEY(crime, year)
);

CREATE TABLE IF NOT EXISTS mcp_urban_incidents(
    accident_type VARCHAR(255),
    burns INT,
    damages INT,
    deaths INT,
    end_time DATETIME,
    firefighters INT,
    fire_station VARCHAR(255),
    fire_trucks INT,
    fire_vessels INT,
    incident VARCHAR(255),
    incident_detail VARCHAR(255),
    injuries INT,
    location_description VARCHAR(255),
    municipality VARCHAR(255),
    people_involved INT,
    prefecture VARCHAR(255),
    start_time DATETIME,
    village VARCHAR(255),
    PRIMARY KEY (
        accident_type,
        start_time,
        end_time,
        location_description
    )
);

CREATE TABLE IF NOT EXISTS mcp_forest_fires(
    address VARCHAR(255),
    agricultural_area_burned FLOAT,
    airplanes_cl215 INT,
    airplanes_cl415 INT,
    airplanes_gru INT,
    airplanes_pzl INT,
    army INT,
    crop_residue_area_burned FLOAT,
    dumping_ground_area_burned FLOAT,
    end_time DATETIME,
    firefighters INT,
    fire_station VARCHAR(255),
    fire_trucks INT,
    forest_area_burned FLOAT,
    forestry VARCHAR(255),
    grove_area_burned FLOAT,
    helicopters INT,
    local_authorities_vehicles INT,
    location VARCHAR(255),
    low_vegetation_area_burned FLOAT,
    machinery INT,
    municipality VARCHAR(255),
    other_firefighters INT,
    prefecture VARCHAR(255),
    start_time DATETIME,
    swamp_area_burned FLOAT,
    volunteers INT,
    water_tank_trucks INT,
    wildland_crew INT,
    woodland_area_burned FLOAT,
    PRIMARY KEY(address, start_time, end_time)
);

CREATE TABLE IF NOT EXISTS mcp_financial_crimes(
    count INT,
    crime VARCHAR(255),
    year YEAR,
    PRIMARY KEY(crime, year)
);

CREATE TABLE IF NOT EXISTS internet_traffic(
    avg_in BIGINT,
    avg_out BIGINT,
    date DATETIME,
    max_in BIGINT,
    max_out BIGINT,
    PRIMARY KEY (date)
);

CREATE TABLE IF NOT EXISTS ktm_harea(
    area FLOAT,
    date DATETIME,
    ota_full_name VARCHAR(255),
    ota_id INT,
    ota_name VARCHAR(255),
    ota_name_en VARCHAR(255),
    PRIMARY KEY (date, ota_id)
);

CREATE TABLE IF NOT EXISTS ktm_confs(
    confiscations INT,
    date DATETIME,
    ota_full_name VARCHAR(255),
    ota_id INT,
    ota_name VARCHAR(255),
    ota_name_en VARCHAR(255),
    PRIMARY KEY (date, ota_id)
);

CREATE TABLE IF NOT EXISTS ktm_liens(
    date DATETIME,
    liens INT,
    ota_full_name VARCHAR(255),
    ota_id INT,
    ota_name VARCHAR(255),
    ota_name_en VARCHAR(255),
    PRIMARY KEY (date, ota_id)
);

CREATE TABLE IF NOT EXISTS ktm_transactions(
    date DATETIME,
    ota_full_name VARCHAR(255),
    ota_id INT,
    ota_name VARCHAR(255),
    ota_name_en VARCHAR(255),
    transactions INT,
    PRIMARY KEY (date, ota_id)
);

CREATE TABLE IF NOT EXISTS ktm_owners(
    date DATETIME,
    ota_full_name VARCHAR(255),
    ota_id INT,
    ota_name VARCHAR(255),
    ota_name_en VARCHAR(255),
    owners INT,
    PRIMARY KEY (date, ota_id)
);

CREATE TABLE IF NOT EXISTS ktm_hplots(
    date DATETIME,
    ota_full_name VARCHAR(255),
    ota_id INT,
    ota_name VARCHAR(255),
    ota_name_en VARCHAR(255),
    plots BIGINT,
    PRIMARY KEY (date, ota_id)
);

CREATE TABLE IF NOT EXISTS ktm_status(
    date DATETIME,
    ota_full_name VARCHAR(255),
    ota_id INT,
    ota_name VARCHAR(255),
    ota_name_en VARCHAR(255),
    status VARCHAR(255),
    PRIMARY KEY (date, ota_id)
);

CREATE TABLE IF NOT EXISTS ktm_plots(
    date DATETIME,
    ota_id INT,
    ota_name VARCHAR(255),
    ota_name_en VARCHAR(255),
    plots INT,
    PRIMARY KEY (date, ota_id)
);

CREATE TABLE IF NOT EXISTS admie_realtimescadares(
    date DATETIME,
    energy_mwh INT,
    PRIMARY KEY (date)
);

CREATE TABLE IF NOT EXISTS admie_realtimescadasystemload(
    date DATETIME,
    energy_mwh INT,
    PRIMARY KEY (date)
);

CREATE TABLE IF NOT EXISTS admie_dailyenergybalanceanalysis(
    date DATETIME,
    energy_mwh INT,
    fuel VARCHAR(255),
    percentage DECIMAL,
    PRIMARY KEY(date, fuel)
);

CREATE TABLE IF NOT EXISTS diavgeia_organization(
    count INT,
    date DATETIME,
    organization VARCHAR(255),
    organization_id VARCHAR(255),
    PRIMARY KEY (date, organization_id)
);

CREATE TABLE IF NOT EXISTS diavgeia_type(
    count INT,
    date DATETIME,
    type VARCHAR(255),
    type_id VARCHAR(255),
    PRIMARY KEY (date, type_id)
);

CREATE TABLE IF NOT EXISTS diavgeia_counts(
    count INT,
    date DATETIME,
    PRIMARY KEY(date)
);

CREATE TABLE IF NOT EXISTS companies_prefecture_type(
    count INT,
    date DATETIME,
    legal_entity_type VARCHAR(255),
    prefecture VARCHAR(255),
    PRIMARY KEY (date, legal_entity_type, prefecture)
);

CREATE TABLE IF NOT EXISTS mitos_services(
    last_updated DATETIME,
    process_id INT,
    process_ns VARCHAR(255),
    process_title_el VARCHAR(255),
    process_title_en VARCHAR(255),
    PRIMARY KEY (last_updated, process_id)
);

CREATE TABLE IF NOT EXISTS gov_et_decrees(
    decree INT,
    description VARCHAR(255),
    effective_date DATETIME,
    feknum INT,
    pages INT,
    publication_date DATETIME,
    PRIMARY KEY (decree, publication_date)
);

CREATE TABLE IF NOT EXISTS gov_et_laws(
    description VARCHAR(255),
    effective_date DATETIME,
    feknum INT,
    law INT,
    pages INT,
    publication_date DATETIME,
    PRIMARY KEY (law, publication_date)
);

CREATE TABLE IF NOT EXISTS public_organizations(
    code INT,
    last_updated DATETIME,
    name VARCHAR(255),
    status VARCHAR(255),
    supervising_organization_code INT,
    type VARCHAR(255),
    PRIMARY KEY (code, last_updated)
);

CREATE TABLE IF NOT EXISTS cadastre_natura_plot(
    area DECIMAL,
    date DATETIME,
    local_authority_id VARCHAR(255),
    plot_number INT,
    PRIMARY KEY (date, local_authority_id)
);

CREATE TABLE IF NOT EXISTS cadastre_plot(
    avg_area DECIMAL,
    date DATETIME,
    local_authority_id VARCHAR(255),
    plot_number INT,
    PRIMARY KEY (date, local_authority_id)
);

CREATE TABLE IF NOT EXISTS oaed_unemployment(
    asofdate DATETIME,
    benefits INT,
    unemployed INT,
    PRIMARY KEY (asofdate)
);

CREATE TABLE IF NOT EXISTS electricity_consumption(
    area VARCHAR(255),
    date DATETIME,
    energy_mwh FLOAT,
    PRIMARY KEY (area, date)
);

CREATE TABLE IF NOT EXISTS minedu_schools(
    area VARCHAR(255),
    district VARCHAR(255),
    email VARCHAR(255),
    fax_number VARCHAR(255),
    lat DECIMAL,
    lng DECIMAL,
    municipality VARCHAR(255),
    municipal_unit VARCHAR(255),
    phone_number VARCHAR(255),
    prefecture VARCHAR(255),
    regional_unit VARCHAR(255),
    school_code VARCHAR(255),
    school_district VARCHAR(255),
    school_name VARCHAR(255),
    school_subtype VARCHAR(255),
    school_type VARCHAR(255),
    street_address VARCHAR(255),
    zip_code VARCHAR(255),
    PRIMARY KEY (school_code)
);

CREATE TABLE IF NOT EXISTS minedu_dep(
    assistant_professors INT,
    associate_professors INT,
    full_professors INT,
    institution VARCHAR(255),
    lecturers INT,
    practice_lecturers INT,
    practice_professors INT,
    year YEAR,
    PRIMARY KEY (institution, year)
);

CREATE TABLE IF NOT EXISTS minedu_students_school(
    district VARCHAR(255),
    jurisdiction VARCHAR(255),
    registered_students_boys INT,
    registered_students_girls INT,
    school_class VARCHAR(255),
    school_name VARCHAR(255),
    school_type VARCHAR(255),
    year YEAR,
    PRIMARY KEY (school_name, year)
);

CREATE TABLE IF NOT EXISTS hcg_incidents(
    domestic INT,
    incident VARCHAR(255),
    international INT,
    year YEAR,
    PRIMARY KEY (incident, year)
);

CREATE TABLE IF NOT EXISTS efet_inspections(
    inspections INT,
    penalties INT,
    violating_organizations ΙΝΤ,
    violations INT,
    year YEAR,
    PRIMARY KEY (year)
);

CREATE TABLE IF NOT EXISTS mintour_agencies(
    active INT,
    entrants INT,
    exits INT,
    quarter CHAR(2),
    year YEAR,
    PRIMARY KEY(quarter, year)
);

CREATE TABLE IF NOT EXISTS minhealth_pharmacists(
    active INT,
    entrants INT,
    exits INT,
    quarter CHAR(2),
    year YEAR,
    PRIMARY KEY(quarter, year)
);

CREATE TABLE IF NOT EXISTS minhealth_pharmacies(
    activte INT,
    entrants INT,
    exits INT,
    quarter CHAR(2),
    year YEAR,
    PRIMARY KEY(quarter, year)
);

CREATE TABLE IF NOT EXISTS minhealth_dentists(
    active INT,
    entrants INT,
    exits INT,
    quarter CHAR(2),
    year YEAR,
    PRIMARY KEY(quarter, year)
);

CREATE TABLE IF NOT EXISTS minhealth_doctors(
    active INT,
    entrants INT,
    exits INT,
    quarter CHAR(2),
    year YEAR,
    PRIMARY KEY(quarter, year)
);

CREATE TABLE IF NOT EXISTS grnet_atlas(
    institution VARCHAR(255),
    ngo INT,
    private_sector INT,
    public_sector INT,
    year YEAR,
    PRIMARY KEY (institution, year)
);

CREATE TABLE IF NOT EXISTS grnet_eudoxus(
    department VARCHAR(255),
    institution VARCHAR(255),
    period VARCHAR(255),
    studentwithdeliveries INT,
    studentwithstatements INT,
    year YEAR,
    PRIMARY KEY (department, institution, period, year)
);

CREATE TABLE IF NOT EXISTS mindev_realtors(
    active INT,
    entrants INT,
    exits INT,
    quarter CHAR(2),
    year YEAR,
    PRIMARY KEY(quarter, year)
);

CREATE TABLE IF NOT EXISTS minenv_inspectors(
    activte INT,
    entrants INT,
    exits INT,
    quarter CHAR(2),
    year YEAR,
    PRIMARY KEY(quarter, year)
);

CREATE TABLE IF NOT EXISTS elte_auditors(
    active INT,
    entrants INT,
    exits INT,
    firms INT,
    quarter CHAR(2),
    year YEAR,
    PRIMARY KEY(quarter, year)
);

CREATE TABLE IF NOT EXISTS eett_telecom_indicators(
    category VARCHAR(255),
    indicator VARCHAR(255),
    value FLOAT,
    year YEAR,
    PRIMARY KEY(category, year)
);

CREATE TABLE IF NOT EXISTS oee_accountants(
    active INT,
    entrants INT,
    exits INT,
    quarter CHAR(2)
);

CREATE TABLE IF NOT EXISTS minjust_law_firms(
    active INT,
    entrants INT,
    exits INT,
    quarter CHAR(2),
    year YEAR,
    PRIMARY KEY(quarter, year)
);

CREATE TABLE IF NOT EXISTS minjust_lawyers(
    active INT,
    entrants INT,
    exits INT,
    quarter CHAR(2),
    year YEAR,
    PRIMARY KEY(quarter, year)
);

CREATE TABLE IF NOT EXISTS eeep_casino_tickets(
    tickets INT,
    year YEAR,
    PRIMARY KEY(year)
);

CREATE TABLE IF NOT EXISTS minstate_election_distribution(
    election_type VARCHAR(255),
    electoral_district VARCHAR(255),
    municipality VARCHAR(255),
    voters_female INT,
    voters_male INT,
    year YEAR,
    PRIMARY KEY(election_type, electoral_district, municipality, year)
);

CREATE TABLE IF NOT EXISTS minstate_election_age(
    age_group VARCHAR(255),
    count INT,
    election_type VARCHAR(255),
    electoral_district VARCHAR(255),
    year YEAR,
    PRIMARY KEY (election_type, electoral_district, year)
);

-- Users to connect with, modify accordingly
CREATE USER IF NOT EXISTS 'metabase' @'%' IDENTIFIED BY 'metabasesqlpassword';

CREATE USER IF NOT EXISTS 'data_gov' @'%' IDENTIFIED BY 'datagovsqlpassword';

GRANT
SELECT
    ON data_gov.* TO 'metabase' @'%';

GRANT ALL ON data_gov.* TO 'data_gov' @'%';

FLUSH PRIVILEGES;