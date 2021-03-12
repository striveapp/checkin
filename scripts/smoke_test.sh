#!/usr/bin/env bash

POSITIONAL=()
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -a|--apk)
    APK="$2"
    shift # past argument
    shift # past value
    ;;
esac
done
set -- "${POSITIONAL[@]}" # restore positional parameters

echo "APK LOCATION = ${APK}"

adb logcat -c
adb install $APK
adb shell am start -n com.arya.checkin/com.arya.checkin.MainActivity
sleep 1
APP_PID=$(adb shell pidof com.arya.checkin)
echo "$APP_PID"
OUTPUT=$(adb logcat -d --buffer=crash --pid="$APP_PID")

if [[ ! -z $OUTPUT ]]; then
    echo "$OUTPUT" 1>&2
    exit 1
else
    echo "PASSED"
fi

