#!/bin/bash

CMD="python ./data_gov/data_gov.py --date-from ${DATE_FROM} --date-to ${DATE_TO} --sleep-seconds ${SLEEP_SECONDS} --max-requests ${MAX_REQUESTS} --interval-days ${INTERVAL_DAYS} --token ${TOKEN} --dataset ${DATASET} --table-name ${TABLE_NAME} --mysql-host ${MYSQL_HOST} --mysql-user ${MYSQL_USER} --mysql-password ${MYSQL_PASSWORD} --mysql-database ${MYSQL_DATABASE}"

exec $CMD
