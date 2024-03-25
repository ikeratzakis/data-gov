-- Runs when the PostgreSQL docker first starts, modify accordingly to your needs
CREATE DATABASE data_gov;

CREATE SCHEMA IF NOT EXISTS data_gov;

ALTER SCHEMA data_gov OWNER TO postgres;

--
-- Name: admie_dailyenergybalanceanalysis; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.admie_dailyenergybalanceanalysis (
    date timestamp with time zone NOT NULL,
    energy_mwh integer,
    fuel character varying(255) NOT NULL,
    percentage numeric(10, 0)
);

ALTER TABLE
    data_gov.admie_dailyenergybalanceanalysis OWNER TO postgres;

--
-- Name: admie_realtimescadares; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.admie_realtimescadares (
    date timestamp with time zone NOT NULL,
    energy_mwh integer
);

ALTER TABLE
    data_gov.admie_realtimescadares OWNER TO postgres;

--
-- Name: admie_realtimescadasystemload; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.admie_realtimescadasystemload (
    date timestamp with time zone NOT NULL,
    energy_mwh integer
);

ALTER TABLE
    data_gov.admie_realtimescadasystemload OWNER TO postgres;

--
-- Name: apdkriti_hydro; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.apdkriti_hydro (
    conductivity double precision,
    dam_volume double precision,
    frequency character varying(255),
    station character varying(255) NOT NULL,
    temperature double precision,
    "timestamp" timestamp without time zone NOT NULL,
    water_depth double precision,
    water_level double precision
);

ALTER TABLE
    data_gov.apdkriti_hydro OWNER TO postgres;

--
-- Name: apdkriti_meteo; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.apdkriti_meteo (
    barometric_pressure double precision,
    eto double precision,
    frequency character varying(255),
    precipitation double precision,
    pyranometer_0__2000_wm double precision,
    rain_duration double precision,
    relative_humidity double precision,
    solar double precision,
    station character varying(255) NOT NULL,
    temperature double precision,
    "timestamp" timestamp without time zone NOT NULL,
    wind_direction double precision,
    wind_speed double precision
);

ALTER TABLE
    data_gov.apdkriti_meteo OWNER TO postgres;

--
-- Name: apdkriti_swimwater; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.apdkriti_swimwater (
    airdirection character varying(255),
    analysis_date timestamp without time zone,
    caoutchouc character varying(255),
    coast character varying(255),
    delivery_date timestamp without time zone,
    description character varying(255),
    ecoli integer,
    garbage character varying(255),
    glass character varying(255),
    intenterococci integer,
    municipal character varying(255),
    perunit character varying(255),
    plastic character varying(255),
    rainfall character varying(255),
    sample_timestamp timestamp without time zone NOT NULL,
    stationcode character varying(255) NOT NULL,
    tar character varying(255),
    wave character varying(255),
    yestrainfall character varying(255)
);

ALTER TABLE
    data_gov.apdkriti_swimwater OWNER TO postgres;

--
-- Name: cadastre_natura_plot; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.cadastre_natura_plot (
    area numeric(10, 0),
    date timestamp with time zone NOT NULL,
    local_authority_id character varying(255) NOT NULL,
    plot_number integer
);

ALTER TABLE
    data_gov.cadastre_natura_plot OWNER TO postgres;

--
-- Name: cadastre_plot; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.cadastre_plot (
    avg_area numeric(10, 0),
    date timestamp with time zone NOT NULL,
    local_authority_id character varying(255) NOT NULL,
    plot_number integer
);

ALTER TABLE
    data_gov.cadastre_plot OWNER TO postgres;

--
-- Name: companies_prefecture_type; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.companies_prefecture_type (
    count integer,
    date timestamp with time zone NOT NULL,
    legal_entity_type character varying(255) NOT NULL,
    prefecture character varying(255) NOT NULL
);

ALTER TABLE
    data_gov.companies_prefecture_type OWNER TO postgres;

--
-- Name: covid_vaccination_data; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.covid_vaccination_data (
    area character varying(255),
    areaid integer NOT NULL,
    dailydose1 integer,
    dailydose2 integer,
    dailydose3 integer,
    daydiff integer,
    daytotal integer,
    referencedate timestamp with time zone NOT NULL,
    totaldistinctpersons integer,
    totaldose1 integer,
    totaldose2 integer,
    totaldose3 integer,
    totalvaccinations integer
);

ALTER TABLE
    data_gov.covid_vaccination_data OWNER TO postgres;

--
-- Name: diavgeia_counts; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.diavgeia_counts (
    count integer,
    date timestamp with time zone NOT NULL
);

ALTER TABLE
    data_gov.diavgeia_counts OWNER TO postgres;

--
-- Name: diavgeia_organization; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.diavgeia_organization (
    count integer,
    date timestamp with time zone NOT NULL,
    organization character varying(255),
    organization_id character varying(255) NOT NULL
);

ALTER TABLE
    data_gov.diavgeia_organization OWNER TO postgres;

--
-- Name: diavgeia_type; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.diavgeia_type (
    count integer,
    date timestamp with time zone NOT NULL,
    type character varying(255),
    type_id character varying(255) NOT NULL
);

ALTER TABLE
    data_gov.diavgeia_type OWNER TO postgres;

--
-- Name: eeep_casino_tickets; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.eeep_casino_tickets (tickets integer, year integer NOT NULL);

ALTER TABLE
    data_gov.eeep_casino_tickets OWNER TO postgres;

--
-- Name: eett_telecom_indicators; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.eett_telecom_indicators (
    category character varying(255) NOT NULL,
    indicator character varying(255),
    value double precision,
    year integer NOT NULL
);

ALTER TABLE
    data_gov.eett_telecom_indicators OWNER TO postgres;

--
-- Name: efet_inspections; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.efet_inspections (
    inspections integer,
    penalties integer,
    violating_organizations integer,
    violations integer,
    year integer NOT NULL
);

ALTER TABLE
    data_gov.efet_inspections OWNER TO postgres;

--
-- Name: ekt_adoption_factors; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.ekt_adoption_factors (
    factor character varying(255) NOT NULL,
    percentage double precision
);

ALTER TABLE
    data_gov.ekt_adoption_factors OWNER TO postgres;

--
-- Name: ekt_business_expenses_sector; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.ekt_business_expenses_sector (
    expenses double precision,
    sector character varying(255) NOT NULL,
    year smallint NOT NULL
);

ALTER TABLE
    data_gov.ekt_business_expenses_sector OWNER TO postgres;

--
-- Name: ekt_digital_tech_use; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.ekt_digital_tech_use (
    percentage double precision,
    technology character varying(255) NOT NULL
);

ALTER TABLE
    data_gov.ekt_digital_tech_use OWNER TO postgres;

--
-- Name: ekt_expenses_source; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.ekt_expenses_source (
    expenses double precision,
    sector character varying(255) NOT NULL,
    year smallint NOT NULL
);

ALTER TABLE
    data_gov.ekt_expenses_source OWNER TO postgres;

--
-- Name: ekt_future_interest_sectors; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.ekt_future_interest_sectors (
    factor character varying(255) NOT NULL,
    percentage double precision
);

ALTER TABLE
    data_gov.ekt_future_interest_sectors OWNER TO postgres;

--
-- Name: ekt_rd_personnel_sector; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.ekt_rd_personnel_sector (
    personnel integer,
    sector character varying(255) NOT NULL,
    year smallint NOT NULL
);

ALTER TABLE
    data_gov.ekt_rd_personnel_sector OWNER TO postgres;

--
-- Name: ekt_research_expenses_sector; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.ekt_research_expenses_sector (
    expenses double precision,
    sector character varying(255) NOT NULL,
    year smallint NOT NULL
);

ALTER TABLE
    data_gov.ekt_research_expenses_sector OWNER TO postgres;

--
-- Name: ekt_tech_growth_assessment; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.ekt_tech_growth_assessment (
    percentage double precision,
    technology character varying(255) NOT NULL
);

ALTER TABLE
    data_gov.ekt_tech_growth_assessment OWNER TO postgres;

--
-- Name: electricity_consumption; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.electricity_consumption (
    area character varying(255) NOT NULL,
    date timestamp with time zone NOT NULL,
    energy_mwh double precision
);

ALTER TABLE
    data_gov.electricity_consumption OWNER TO postgres;

--
-- Name: elte_auditors; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.elte_auditors (
    active integer,
    entrants integer,
    exits integer,
    firms integer,
    quarter character(2) NOT NULL,
    year integer NOT NULL
);

ALTER TABLE
    data_gov.elte_auditors OWNER TO postgres;

--
-- Name: gov_et_decrees; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.gov_et_decrees (
    decree integer NOT NULL,
    description character varying(255),
    effective_date timestamp with time zone,
    feknum integer,
    pages integer,
    publication_date timestamp with time zone NOT NULL
);

ALTER TABLE
    data_gov.gov_et_decrees OWNER TO postgres;

--
-- Name: gov_et_laws; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.gov_et_laws (
    description character varying(255),
    effective_date timestamp with time zone,
    feknum integer,
    law integer NOT NULL,
    pages integer,
    publication_date timestamp with time zone NOT NULL
);

ALTER TABLE
    data_gov.gov_et_laws OWNER TO postgres;

--
-- Name: grnet_atlas; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.grnet_atlas (
    institution character varying(255) NOT NULL,
    ngo integer,
    private_sector integer,
    public_sector integer,
    year integer NOT NULL
);

ALTER TABLE
    data_gov.grnet_atlas OWNER TO postgres;

--
-- Name: grnet_eudoxus; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.grnet_eudoxus (
    department character varying(255) NOT NULL,
    institution character varying(255) NOT NULL,
    period character varying(255) NOT NULL,
    studentwithdeliveries integer,
    studentwithstatements integer,
    year integer NOT NULL
);

ALTER TABLE
    data_gov.grnet_eudoxus OWNER TO postgres;

--
-- Name: hcg_incidents; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.hcg_incidents (
    domestic integer,
    incident character varying(255) NOT NULL,
    international integer,
    year integer NOT NULL
);

ALTER TABLE
    data_gov.hcg_incidents OWNER TO postgres;

--
-- Name: internet_traffic; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.internet_traffic (
    avg_in bigint,
    avg_out bigint,
    date timestamp with time zone NOT NULL,
    max_in bigint,
    max_out bigint
);

ALTER TABLE
    data_gov.internet_traffic OWNER TO postgres;

--
-- Name: ktm_confs; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.ktm_confs (
    confiscations integer,
    date timestamp with time zone NOT NULL,
    ota_full_name character varying(255),
    ota_id integer NOT NULL,
    ota_name character varying(255),
    ota_name_en character varying(255)
);

ALTER TABLE
    data_gov.ktm_confs OWNER TO postgres;

--
-- Name: ktm_harea; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.ktm_harea (
    area double precision,
    date timestamp with time zone NOT NULL,
    ota_full_name character varying(255),
    ota_id integer NOT NULL,
    ota_name character varying(255),
    ota_name_en character varying(255)
);

ALTER TABLE
    data_gov.ktm_harea OWNER TO postgres;

--
-- Name: ktm_hplots; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.ktm_hplots (
    date timestamp with time zone NOT NULL,
    ota_full_name character varying(255),
    ota_id integer NOT NULL,
    ota_name character varying(255),
    ota_name_en character varying(255),
    plots bigint
);

ALTER TABLE
    data_gov.ktm_hplots OWNER TO postgres;

--
-- Name: ktm_liens; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.ktm_liens (
    date timestamp with time zone NOT NULL,
    liens integer,
    ota_full_name character varying(255),
    ota_id integer NOT NULL,
    ota_name character varying(255),
    ota_name_en character varying(255)
);

ALTER TABLE
    data_gov.ktm_liens OWNER TO postgres;

--
-- Name: ktm_owners; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.ktm_owners (
    date timestamp with time zone NOT NULL,
    ota_full_name character varying(255),
    ota_id integer NOT NULL,
    ota_name character varying(255),
    ota_name_en character varying(255),
    owners integer
);

ALTER TABLE
    data_gov.ktm_owners OWNER TO postgres;

--
-- Name: ktm_plots; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.ktm_plots (
    date timestamp with time zone NOT NULL,
    ota_id integer NOT NULL,
    ota_name character varying(255),
    ota_name_en character varying(255),
    plots integer
);

ALTER TABLE
    data_gov.ktm_plots OWNER TO postgres;

--
-- Name: ktm_status; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.ktm_status (
    date timestamp with time zone NOT NULL,
    ota_full_name character varying(255),
    ota_id integer NOT NULL,
    ota_name character varying(255),
    ota_name_en character varying(255),
    status character varying(255)
);

ALTER TABLE
    data_gov.ktm_status OWNER TO postgres;

--
-- Name: ktm_transactions; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.ktm_transactions (
    date timestamp with time zone NOT NULL,
    ota_full_name character varying(255),
    ota_id integer NOT NULL,
    ota_name character varying(255),
    ota_name_en character varying(255),
    transactions integer
);

ALTER TABLE
    data_gov.ktm_transactions OWNER TO postgres;

--
-- Name: mcp_crime; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.mcp_crime (
    attempted integer,
    committed integer,
    crime character varying(255) NOT NULL,
    domestic_criminals integer,
    foreign_criminals integer,
    solved integer,
    year integer NOT NULL
);

ALTER TABLE
    data_gov.mcp_crime OWNER TO postgres;

--
-- Name: mcp_financial_crimes; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.mcp_financial_crimes (
    count integer,
    crime character varying(255) NOT NULL,
    year integer NOT NULL
);

ALTER TABLE
    data_gov.mcp_financial_crimes OWNER TO postgres;

--
-- Name: mcp_forest_fires; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.mcp_forest_fires (
    address character varying(255) NOT NULL,
    agricultural_area_burned double precision,
    airplanes_cl215 integer,
    airplanes_cl415 integer,
    airplanes_gru integer,
    airplanes_pzl integer,
    army integer,
    crop_residue_area_burned double precision,
    dumping_ground_area_burned double precision,
    end_time timestamp with time zone NOT NULL,
    firefighters integer,
    fire_station character varying(255),
    fire_trucks integer,
    forest_area_burned double precision,
    forestry character varying(255),
    grove_area_burned double precision,
    helicopters integer,
    local_authorities_vehicles integer,
    location character varying(255),
    low_vegetation_area_burned double precision,
    machinery integer,
    municipality character varying(255),
    other_firefighters integer,
    prefecture character varying(255),
    start_time timestamp with time zone NOT NULL,
    swamp_area_burned double precision,
    volunteers integer,
    water_tank_trucks integer,
    wildland_crew integer,
    woodland_area_burned double precision
);

ALTER TABLE
    data_gov.mcp_forest_fires OWNER TO postgres;

--
-- Name: mcp_traffic_accidents; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.mcp_traffic_accidents (
    deadly_accidents integer,
    deaths integer,
    jurisdiction character varying(255) NOT NULL,
    other_accidents integer,
    other_injured integer,
    serious_accidents integer,
    seriously_injured integer,
    year integer NOT NULL
);

ALTER TABLE
    data_gov.mcp_traffic_accidents OWNER TO postgres;

--
-- Name: mcp_traffic_violations; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.mcp_traffic_violations (
    count integer,
    violation character varying(255) NOT NULL,
    year integer NOT NULL
);

ALTER TABLE
    data_gov.mcp_traffic_violations OWNER TO postgres;

--
-- Name: mcp_urban_incidents; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.mcp_urban_incidents (
    accident_type character varying(255) NOT NULL,
    burns integer,
    damages integer,
    deaths integer,
    end_time timestamp with time zone NOT NULL,
    firefighters integer,
    fire_station character varying(255),
    fire_trucks integer,
    fire_vessels integer,
    incident character varying(255),
    incident_detail character varying(255),
    injuries integer,
    location_description character varying(255) NOT NULL,
    municipality character varying(255),
    people_involved integer,
    prefecture character varying(255),
    start_time timestamp with time zone NOT NULL,
    village character varying(255)
);

ALTER TABLE
    data_gov.mcp_urban_incidents OWNER TO postgres;

--
-- Name: mindev_realtors; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.mindev_realtors (
    active integer,
    entrants integer,
    exits integer,
    quarter character(2) NOT NULL,
    year integer NOT NULL
);

ALTER TABLE
    data_gov.mindev_realtors OWNER TO postgres;

--
-- Name: minedu_dep; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.minedu_dep (
    assistant_professors integer,
    associate_professors integer,
    full_professors integer,
    institution character varying(255) NOT NULL,
    lecturers integer,
    practice_lecturers integer,
    practice_professors integer,
    year integer NOT NULL
);

ALTER TABLE
    data_gov.minedu_dep OWNER TO postgres;

--
-- Name: minedu_schools; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.minedu_schools (
    area character varying(255),
    district character varying(255),
    email character varying(255),
    fax_number character varying(255),
    lat numeric(10, 0),
    lng numeric(10, 0),
    municipality character varying(255),
    municipal_unit character varying(255),
    phone_number character varying(255),
    prefecture character varying(255),
    regional_unit character varying(255),
    school_code character varying(255) NOT NULL,
    school_district character varying(255),
    school_name character varying(255),
    school_subtype character varying(255),
    school_type character varying(255),
    street_address character varying(255),
    zip_code character varying(255)
);

ALTER TABLE
    data_gov.minedu_schools OWNER TO postgres;

--
-- Name: minedu_students_school; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.minedu_students_school (
    district character varying(255),
    jurisdiction character varying(255),
    registered_students_boys integer,
    registered_students_girls integer,
    school_class character varying(255),
    school_name character varying(255) NOT NULL,
    school_type character varying(255),
    year integer NOT NULL
);

ALTER TABLE
    data_gov.minedu_students_school OWNER TO postgres;

--
-- Name: minenv_inspectors; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.minenv_inspectors (
    active integer,
    entrants integer,
    exits integer,
    quarter character(2) NOT NULL,
    year integer NOT NULL
);

ALTER TABLE
    data_gov.minenv_inspectors OWNER TO postgres;

--
-- Name: minhealth_dentists; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.minhealth_dentists (
    active integer,
    entrants integer,
    exits integer,
    quarter character(2) NOT NULL,
    year integer NOT NULL
);

ALTER TABLE
    data_gov.minhealth_dentists OWNER TO postgres;

--
-- Name: minhealth_doctors; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.minhealth_doctors (
    active integer,
    entrants integer,
    exits integer,
    quarter character(2) NOT NULL,
    year integer NOT NULL
);

ALTER TABLE
    data_gov.minhealth_doctors OWNER TO postgres;

--
-- Name: minhealth_pharmacies; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.minhealth_pharmacies (
    active integer,
    entrants integer,
    exits integer,
    quarter character(2) NOT NULL,
    year integer NOT NULL
);

ALTER TABLE
    data_gov.minhealth_pharmacies OWNER TO postgres;

--
-- Name: minhealth_pharmacists; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.minhealth_pharmacists (
    active integer,
    entrants integer,
    exits integer,
    quarter character(2) NOT NULL,
    year integer NOT NULL
);

ALTER TABLE
    data_gov.minhealth_pharmacists OWNER TO postgres;

--
-- Name: minjust_law_firms; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.minjust_law_firms (
    active integer,
    entrants integer,
    exits integer,
    quarter character(2) NOT NULL,
    year integer NOT NULL
);

ALTER TABLE
    data_gov.minjust_law_firms OWNER TO postgres;

--
-- Name: minjust_lawyers; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.minjust_lawyers (
    active integer,
    entrants integer,
    exits integer,
    quarter character(2) NOT NULL,
    year integer NOT NULL
);

ALTER TABLE
    data_gov.minjust_lawyers OWNER TO postgres;

--
-- Name: minstate_election_age; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.minstate_election_age (
    age_group character varying(255),
    count integer,
    election_type character varying(255) NOT NULL,
    electoral_district character varying(255) NOT NULL,
    year integer NOT NULL
);

ALTER TABLE
    data_gov.minstate_election_age OWNER TO postgres;

--
-- Name: minstate_election_distribution; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.minstate_election_distribution (
    election_type character varying(255) NOT NULL,
    electoral_district character varying(255) NOT NULL,
    municipality character varying(255) NOT NULL,
    voters_female integer,
    voters_male integer,
    year integer NOT NULL
);

ALTER TABLE
    data_gov.minstate_election_distribution OWNER TO postgres;

--
-- Name: mintour_agencies; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.mintour_agencies (
    active integer,
    entrants integer,
    exits integer,
    quarter character(2) NOT NULL,
    year integer NOT NULL
);

ALTER TABLE
    data_gov.mintour_agencies OWNER TO postgres;

--
-- Name: mitos_services; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.mitos_services (
    last_updated timestamp with time zone NOT NULL,
    process_id integer NOT NULL,
    process_ns character varying(255),
    process_title_el character varying(255),
    process_title_en character varying(255)
);

ALTER TABLE
    data_gov.mitos_services OWNER TO postgres;

--
-- Name: oaed_unemployment; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.oaed_unemployment (
    asofdate timestamp with time zone NOT NULL,
    benefits integer,
    unemployed integer
);

ALTER TABLE
    data_gov.oaed_unemployment OWNER TO postgres;

--
-- Name: oasa_ridership; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.oasa_ridership (
    date_hour timestamp with time zone,
    dv_agency character varying(255),
    dv_platenum_station character varying(255),
    dv_route text,
    dv_validations integer,
    load_dt timestamp with time zone,
    routes_per_hour integer
);

ALTER TABLE
    data_gov.oasa_ridership OWNER TO postgres;

--
-- Name: oee_accountants; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.oee_accountants (
    active integer,
    entrants integer,
    exits integer,
    quarter character(2)
);

ALTER TABLE
    data_gov.oee_accountants OWNER TO postgres;

--
-- Name: prisons_capacity; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.prisons_capacity (
    area double precision,
    date timestamp with time zone NOT NULL,
    farmers_capacity integer,
    female_capacity integer,
    juvenile_capacity integer,
    male_capacity integer,
    net_capacity integer,
    percent_capacity double precision,
    prison character varying(255) NOT NULL,
    prisoners integer,
    rehab_capacity integer,
    total_capacity integer,
    young_adults_capacity integer
);

ALTER TABLE
    data_gov.prisons_capacity OWNER TO postgres;

--
-- Name: prisons_occupancy; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.prisons_occupancy (
    adults integer,
    date timestamp with time zone NOT NULL,
    juveniles integer,
    prison character varying(255) NOT NULL,
    total integer,
    young_adults integer
);

ALTER TABLE
    data_gov.prisons_occupancy OWNER TO postgres;

--
-- Name: public_organizations; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.public_organizations (
    code integer NOT NULL,
    last_updated timestamp with time zone NOT NULL,
    name character varying(255),
    status character varying(255),
    supervising_organization_code integer,
    type character varying(255)
);

ALTER TABLE
    data_gov.public_organizations OWNER TO postgres;

--
-- Name: road_traffic_attica; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.road_traffic_attica (
    appprocesstime timestamp with time zone NOT NULL,
    average_speed double precision,
    countedcars integer,
    deviceid character varying(255) NOT NULL,
    road_info character varying(255),
    road_name character varying(255)
);

ALTER TABLE
    data_gov.road_traffic_attica OWNER TO postgres;

--
-- Name: sailing_traffic; Type: TABLE; Schema: data_gov; Owner: postgres
--
CREATE TABLE data_gov.sailing_traffic (
    arrivalport character varying(255) NOT NULL,
    arrivalportname character varying(255),
    date timestamp with time zone NOT NULL,
    departureport character varying(255) NOT NULL,
    departureportname character varying(255),
    passengercount integer,
    routecode character varying(255),
    routecodenames character varying(255),
    vehiclecount integer
);

ALTER TABLE
    data_gov.sailing_traffic OWNER TO postgres;

--
-- Name: apdkriti_hydro apdkriti_hydro_pkey; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.apdkriti_hydro
ADD
    CONSTRAINT apdkriti_hydro_pkey PRIMARY KEY (station, "timestamp");

--
-- Name: apdkriti_meteo apdkriti_meteo_pkey; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.apdkriti_meteo
ADD
    CONSTRAINT apdkriti_meteo_pkey PRIMARY KEY (station, "timestamp");

--
-- Name: apdkriti_swimwater apdkriti_swimwater_pkey; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.apdkriti_swimwater
ADD
    CONSTRAINT apdkriti_swimwater_pkey PRIMARY KEY (stationcode, sample_timestamp);

--
-- Name: ekt_adoption_factors ekt_adoption_factors_pkey; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.ekt_adoption_factors
ADD
    CONSTRAINT ekt_adoption_factors_pkey PRIMARY KEY (factor);

--
-- Name: ekt_business_expenses_sector ekt_business_expenses_sector_pkey; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.ekt_business_expenses_sector
ADD
    CONSTRAINT ekt_business_expenses_sector_pkey PRIMARY KEY (sector, year);

--
-- Name: ekt_digital_tech_use ekt_digital_tech_use_pkey; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.ekt_digital_tech_use
ADD
    CONSTRAINT ekt_digital_tech_use_pkey PRIMARY KEY (technology);

--
-- Name: ekt_expenses_source ekt_expenses_source_pkey; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.ekt_expenses_source
ADD
    CONSTRAINT ekt_expenses_source_pkey PRIMARY KEY (sector, year);

--
-- Name: ekt_future_interest_sectors ekt_future_interest_sectors_pkey; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.ekt_future_interest_sectors
ADD
    CONSTRAINT ekt_future_interest_sectors_pkey PRIMARY KEY (factor);

--
-- Name: ekt_rd_personnel_sector ekt_rd_personnel_sector_pkey; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.ekt_rd_personnel_sector
ADD
    CONSTRAINT ekt_rd_personnel_sector_pkey PRIMARY KEY (sector, year);

--
-- Name: ekt_research_expenses_sector ekt_research_expenses_sector_pkey; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.ekt_research_expenses_sector
ADD
    CONSTRAINT ekt_research_expenses_sector_pkey PRIMARY KEY (sector, year);

--
-- Name: ekt_tech_growth_assessment ekt_tech_growth_assessment_pkey; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.ekt_tech_growth_assessment
ADD
    CONSTRAINT ekt_tech_growth_assessment_pkey PRIMARY KEY (technology);

--
-- Name: admie_dailyenergybalanceanalysis idx_35124_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.admie_dailyenergybalanceanalysis
ADD
    CONSTRAINT idx_35124_primary PRIMARY KEY (date, fuel);

--
-- Name: cadastre_natura_plot idx_35133_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.cadastre_natura_plot
ADD
    CONSTRAINT idx_35133_primary PRIMARY KEY (date, local_authority_id);

--
-- Name: cadastre_plot idx_35136_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.cadastre_plot
ADD
    CONSTRAINT idx_35136_primary PRIMARY KEY (date, local_authority_id);

--
-- Name: companies_prefecture_type idx_35139_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.companies_prefecture_type
ADD
    CONSTRAINT idx_35139_primary PRIMARY KEY (date, legal_entity_type, prefecture);

--
-- Name: covid_vaccination_data idx_35144_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.covid_vaccination_data
ADD
    CONSTRAINT idx_35144_primary PRIMARY KEY (areaid, referencedate);

--
-- Name: diavgeia_counts idx_35147_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.diavgeia_counts
ADD
    CONSTRAINT idx_35147_primary PRIMARY KEY (date);

--
-- Name: diavgeia_organization idx_35150_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.diavgeia_organization
ADD
    CONSTRAINT idx_35150_primary PRIMARY KEY (date, organization_id);

--
-- Name: diavgeia_type idx_35155_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.diavgeia_type
ADD
    CONSTRAINT idx_35155_primary PRIMARY KEY (date, type_id);

--
-- Name: eeep_casino_tickets idx_35160_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.eeep_casino_tickets
ADD
    CONSTRAINT idx_35160_primary PRIMARY KEY (year);

--
-- Name: eett_telecom_indicators idx_35163_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.eett_telecom_indicators
ADD
    CONSTRAINT idx_35163_primary PRIMARY KEY (category, year);

--
-- Name: efet_inspections idx_35168_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.efet_inspections
ADD
    CONSTRAINT idx_35168_primary PRIMARY KEY (year);

--
-- Name: electricity_consumption idx_35171_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.electricity_consumption
ADD
    CONSTRAINT idx_35171_primary PRIMARY KEY (area, date);

--
-- Name: elte_auditors idx_35174_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.elte_auditors
ADD
    CONSTRAINT idx_35174_primary PRIMARY KEY (quarter, year);

--
-- Name: gov_et_decrees idx_35177_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.gov_et_decrees
ADD
    CONSTRAINT idx_35177_primary PRIMARY KEY (decree, publication_date);

--
-- Name: gov_et_laws idx_35180_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.gov_et_laws
ADD
    CONSTRAINT idx_35180_primary PRIMARY KEY (law, publication_date);

--
-- Name: grnet_atlas idx_35183_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.grnet_atlas
ADD
    CONSTRAINT idx_35183_primary PRIMARY KEY (institution, year);

--
-- Name: grnet_eudoxus idx_35186_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.grnet_eudoxus
ADD
    CONSTRAINT idx_35186_primary PRIMARY KEY (department, institution, period, year);

--
-- Name: hcg_incidents idx_35191_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.hcg_incidents
ADD
    CONSTRAINT idx_35191_primary PRIMARY KEY (incident, year);

--
-- Name: ktm_confs idx_35197_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.ktm_confs
ADD
    CONSTRAINT idx_35197_primary PRIMARY KEY (date, ota_id);

--
-- Name: ktm_harea idx_35202_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.ktm_harea
ADD
    CONSTRAINT idx_35202_primary PRIMARY KEY (date, ota_id);

--
-- Name: ktm_hplots idx_35207_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.ktm_hplots
ADD
    CONSTRAINT idx_35207_primary PRIMARY KEY (date, ota_id);

--
-- Name: ktm_liens idx_35212_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.ktm_liens
ADD
    CONSTRAINT idx_35212_primary PRIMARY KEY (date, ota_id);

--
-- Name: ktm_owners idx_35217_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.ktm_owners
ADD
    CONSTRAINT idx_35217_primary PRIMARY KEY (date, ota_id);

--
-- Name: ktm_plots idx_35222_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.ktm_plots
ADD
    CONSTRAINT idx_35222_primary PRIMARY KEY (date, ota_id);

--
-- Name: ktm_status idx_35227_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.ktm_status
ADD
    CONSTRAINT idx_35227_primary PRIMARY KEY (date, ota_id);

--
-- Name: ktm_transactions idx_35232_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.ktm_transactions
ADD
    CONSTRAINT idx_35232_primary PRIMARY KEY (date, ota_id);

--
-- Name: mcp_crime idx_35237_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.mcp_crime
ADD
    CONSTRAINT idx_35237_primary PRIMARY KEY (crime, year);

--
-- Name: mcp_financial_crimes idx_35240_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.mcp_financial_crimes
ADD
    CONSTRAINT idx_35240_primary PRIMARY KEY (crime, year);

--
-- Name: mcp_traffic_accidents idx_35248_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.mcp_traffic_accidents
ADD
    CONSTRAINT idx_35248_primary PRIMARY KEY (jurisdiction, year);

--
-- Name: mcp_traffic_violations idx_35251_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.mcp_traffic_violations
ADD
    CONSTRAINT idx_35251_primary PRIMARY KEY (violation, year);

--
-- Name: mcp_urban_incidents idx_35254_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.mcp_urban_incidents
ADD
    CONSTRAINT idx_35254_primary PRIMARY KEY (
        accident_type,
        start_time,
        end_time,
        location_description
    );

--
-- Name: mindev_realtors idx_35259_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.mindev_realtors
ADD
    CONSTRAINT idx_35259_primary PRIMARY KEY (quarter, year);

--
-- Name: minedu_dep idx_35262_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.minedu_dep
ADD
    CONSTRAINT idx_35262_primary PRIMARY KEY (institution, year);

--
-- Name: minedu_schools idx_35265_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.minedu_schools
ADD
    CONSTRAINT idx_35265_primary PRIMARY KEY (school_code);

--
-- Name: minedu_students_school idx_35270_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.minedu_students_school
ADD
    CONSTRAINT idx_35270_primary PRIMARY KEY (school_name, year);

--
-- Name: minenv_inspectors idx_35275_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.minenv_inspectors
ADD
    CONSTRAINT idx_35275_primary PRIMARY KEY (quarter, year);

--
-- Name: minhealth_dentists idx_35278_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.minhealth_dentists
ADD
    CONSTRAINT idx_35278_primary PRIMARY KEY (quarter, year);

--
-- Name: minhealth_doctors idx_35281_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.minhealth_doctors
ADD
    CONSTRAINT idx_35281_primary PRIMARY KEY (quarter, year);

--
-- Name: minhealth_pharmacies idx_35284_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.minhealth_pharmacies
ADD
    CONSTRAINT idx_35284_primary PRIMARY KEY (quarter, year);

--
-- Name: minhealth_pharmacists idx_35287_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.minhealth_pharmacists
ADD
    CONSTRAINT idx_35287_primary PRIMARY KEY (quarter, year);

--
-- Name: minjust_law_firms idx_35290_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.minjust_law_firms
ADD
    CONSTRAINT idx_35290_primary PRIMARY KEY (quarter, year);

--
-- Name: minjust_lawyers idx_35293_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.minjust_lawyers
ADD
    CONSTRAINT idx_35293_primary PRIMARY KEY (quarter, year);

--
-- Name: minstate_election_age idx_35296_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.minstate_election_age
ADD
    CONSTRAINT idx_35296_primary PRIMARY KEY (election_type, electoral_district, year);

--
-- Name: minstate_election_distribution idx_35301_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.minstate_election_distribution
ADD
    CONSTRAINT idx_35301_primary PRIMARY KEY (
        election_type,
        electoral_district,
        municipality,
        year
    );

--
-- Name: mintour_agencies idx_35306_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.mintour_agencies
ADD
    CONSTRAINT idx_35306_primary PRIMARY KEY (quarter, year);

--
-- Name: mitos_services idx_35309_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.mitos_services
ADD
    CONSTRAINT idx_35309_primary PRIMARY KEY (last_updated, process_id);

--
-- Name: oaed_unemployment idx_35314_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.oaed_unemployment
ADD
    CONSTRAINT idx_35314_primary PRIMARY KEY (asofdate);

--
-- Name: prisons_capacity idx_35325_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.prisons_capacity
ADD
    CONSTRAINT idx_35325_primary PRIMARY KEY (date, prison);

--
-- Name: prisons_occupancy idx_35328_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.prisons_occupancy
ADD
    CONSTRAINT idx_35328_primary PRIMARY KEY (date, prison);

--
-- Name: public_organizations idx_35331_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.public_organizations
ADD
    CONSTRAINT idx_35331_primary PRIMARY KEY (code, last_updated);

--
-- Name: sailing_traffic idx_35341_primary; Type: CONSTRAINT; Schema: data_gov; Owner: postgres
--
ALTER TABLE
    ONLY data_gov.sailing_traffic
ADD
    CONSTRAINT idx_35341_primary PRIMARY KEY (date, departureport, arrivalport);


ALTER TABLE
    data_gov.oasa_ridership
ADD
    CONSTRAINT oasa_ridership_pkey PRIMARY KEY(date_hour, dv_agency, dv_platenum_station);

ALTER TABLE
    data_gov.road_traffic_attica
ADD
    CONSTRAINT road_traffic_attica_pkey PRIMARY KEY(appprocesstime, deviceid);

ALTER TABLE
    data_gov.admie_realtimescadares
ADD
    CONSTRAINT admie_realtimescadares_pkey PRIMARY KEY(date);

ALTER TABLE
    data_gov.admie_realtimescadasystemload
ADD
    CONSTRAINT admie_realtimescadasystemload_pkey PRIMARY KEY(date);

ALTER TABLE
    data_gov.internet_traffic
ADD
    CONSTRAINT internet_traffic_pkey PRIMARY KEY(date);

ALTER TABLE
    data_gov.mcp_forest_fires
ADD
    CONSTRAINT mcp_forest_fires_pkey PRIMARY KEY(address, start_time, end_time)

