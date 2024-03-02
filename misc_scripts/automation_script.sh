#!/bin/bash

# Alternating arguments (modify as needed)
datasets=("mdg_emvolio" "oasa_ridership")
table_names=("covid_vaccination_data" "oasa_ridership")

# Constant arguments
token="your_token"
mysql_host="your_mysql_host"
mysql_user="your_mysql_user"
mysql_password="your_mysql_password"
mysql_database="data_gov"

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
    python3.12 $data_gov_script --token=$token --dataset=${datasets[$i]} --table-name=${table_names[$i]} --mysql-host=$mysql_host --mysql-user=$mysql_user --mysql-password=$mysql_password --mysql-database=$mysql_database --date-from=$date_from --date-to=$date_to --sleep-seconds=$sleep_seconds --max-requests=$max_requests --interval-days=$interval_days
done

echo "Ran data gov for $length datasets"
