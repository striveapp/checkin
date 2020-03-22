#!/bin/bash

gcloud --project=checkin-test-fba3d firestore import gs://checkin-test-fba3d-firestore-backups/2020-03-21 --async
sleep 7
VM_SERVICE_URL=http://127.0.0.1:8888 dart test_driver/journeys/attend_test.dart
