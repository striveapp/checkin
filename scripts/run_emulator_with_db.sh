#!/bin/bash
set -e

options() {
 cat <<EOF
  -d|--dev              get backup from DEV env
  -p|--prod             get backup from PROD env
  --date                setup the date from which the backup should be taken (ISO format yyyy-mm-dd)
  --options             prints available options
EOF
}

help_message() {
  cat <<EOF
Usage: $0 [options]

Options:
$(options)
EOF
}

# main
params=$@

while [[ "$1" != "" ]]; do
  case "$1" in
    #0. Ask for environment (defaults to dev if not)
    -d|--dev)
      DB_ENV="checkin-test-fba3d"
      ;;
    -p|--prod)
      DB_ENV="checkin-b7e8d"
      ;;
    #1. Ask for specific date in the ISO format (yyyy-mm-dd)
    --date)
      DATE="$2"; shift
      ;;
    *)
      help_message
      exit 1
  esac
  shift
done

if [[ -z "$DB_ENV" ]] || [[ -z "$DATE" ]]; then
  help_message
  exit 1
fi

TEST_DATA_DIR="$(pwd)/test/data/firestore_export"

rm -rf "$TEST_DATA_DIR"
mkdir -p "$TEST_DATA_DIR"

#2. Download the backup and place it inside test/data
gsutil -m cp -r "gs://${DB_ENV}-firestore-backups/${DATE}/" "$TEST_DATA_DIR"

#3. extract the data and replace the old one
mv "${TEST_DATA_DIR:?}"/$DATE/* "$TEST_DATA_DIR"
mv "${TEST_DATA_DIR:?}"/$DATE.overall_export_metadata "${TEST_DATA_DIR:?}"/firestore_export.overall_export_metadata
rm -r "${TEST_DATA_DIR:?}"/$DATE

#4. run the emulator with the new data
firebase emulators:start --import test/data