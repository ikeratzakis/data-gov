#!/bin/bash

# Alternating arguments (modify as needed - ones supplied are the ones that get regularly updated)
datasets=("oasa_ridership" "ktm_harea" "ktm_confs" "ktm_liens" "ktm_transactions" "ktm_owners" "ktm_hplots" "ktm_status" "internet_traffic" "diavgeia-organization" "diavgeia-type" "diavgeia-counts" "mdg_emvolio" "sailing_traffic" "admie_realtimescadares" admie_"realtimescadasystemload" "admie_dailyenergybalanceanalysis" )
table_names=("oasa_ridership" "ktm_harea" "ktm_confs" "ktm_liens" "ktm_transactions" "ktm_owners" "ktm_hplots" "ktm_status" "internet_traffic" "diavgeia_organization" "diavgeia_type" "diavgeia_counts" "covid_vaccination_data" "sailing_traffic" "admie_realtimescadares" "admie_realtimescadasystemload" "admie_dailyenergybalanceanalysis" )


# Constant arguments
token="YOUR_GOV_TOKEN"
postgres_host="YOUR_POSTGRES_HOST"
postgres_user="YOUR_POSTGRES_USER"
postgres_password="YOUR_POSTGRES_PASSWORD"
postgres_database="YOUR_POSTGRES_DATABASE"
postgres_schema="YOUR_POSTGRES_SCHEMA"

# Data gov script path
data_gov_script="../data_gov/data_gov.py"

# Get the length of the arrays
length=${#datasets[@]}

# Variables
date_from=$1
date_to=$2
sleep_seconds=$3
max_requests=$4
interval_days=$5

# Check if all arguments are provided
if [ "$#" -ne 5 ]; then
    echo "Usage: $0 date_from date_to sleep_seconds max_requests interval_days"
    exit 1
fi

# Iterate over the datasets-tables in pairs - don't run in parallel to avoid stressing the server
for ((i=0; i<$length; i++))
do
    # Run the python script with the arguments
    python3.12 $data_gov_script --token=$token --dataset=${datasets[$i]} --table-name=${table_names[$i]} --postgres-schema=$postgres_schema --postgres-host=$postgres_host --postgres-user=$postgres_user --postgres-password=$postgres_password --postgres-database=$postgres_database --date-from=$date_from --date-to=$date_to --sleep-seconds=$sleep_seconds --max-requests=$max_requests --interval-days=$interval_days
    sleep 3
done

echo "Ran data gov for $length datasets"
