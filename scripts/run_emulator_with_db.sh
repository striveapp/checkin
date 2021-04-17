#!/bin/bash

#0. Ask for environment (defaults to dev if not)
#1. Ask for specific date in the ISO format (yyyy-mm-dd)
#2. Download the backup and place it inside test/data
#3. extract the data and replace the old one
#4. run the emulator with the new data


DATE="2021-04-16"
location="$(pwd)/test/data/firestore_export/"

gsutil -m cp -r "gs://checkin-b7e8d-firestore-backups/${DATE}/" "$location"

mv $location/$DATE/
