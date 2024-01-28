#!/bin/bash

CMD="python ./data_gov/data_gov.py --token ${TOKEN} --dataset ${DATASET} --table-name ${TABLE_NAME} --table-key-column ${TABLE_KEY_COLUMN} --mysql-host ${MYSQL_HOST} --mysql-user ${MYSQL_USER} --mysql-password ${MYSQL_PASSWORD} --mysql-database ${MYSQL_DATABASE}"

if [ -n "${CRAWL_MODE}" ]; then
    CMD="${CMD} --crawl-mode"
fi

exec $CMD
