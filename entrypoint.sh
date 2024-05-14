#!/bin/bash

set -Eeuo pipefail

count=0
NAS_MOUNTED=0
while [ $count -lt 25 ]
do
    if [ -d "/mnt/data" ]
    then
        echo "Directory /mnt/data exists. Begin Mount."
	    break
    else
        echo "Directory /mnt/data does not exist. Waiting for 1 seconds."
        sleep 1
        count=$((count+1))
    fi
done

if [ $count -ge 25 ]; then
  echo "Directory /mnt/auto does not exist. Maximum wait time exceeded."
  exit 1
fi

bash /app/backend/start.sh