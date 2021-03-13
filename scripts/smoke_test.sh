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
if [[ ! -z "$(adb shell pm list packages | grep -E com.arya.checkin$)" ]]; then
  adb uninstall com.arya.checkin
fi
adb install $APK
adb shell am start -n com.arya.checkin/com.arya.checkin.MainActivity
sleep 1
APP_PID=$(adb shell pidof com.arya.checkin)
echo "$APP_PID"

while true;
do
  sleep 1
  MAIN_OUTPUT=$(adb logcat -d --buffer=main --pid="$APP_PID" | grep "AuthEvent.appStarted()")
  CRASH_OUTPUT=$(adb logcat -d --buffer=crash --pid="$APP_PID")
  if [[ ! -z "$CRASH_OUTPUT" ]]; then
    echo "$CRASH_OUTPUT"
    exit 1
  fi
  if [[ ! -z "$MAIN_OUTPUT" ]]; then
    echo "PASSED"
    exit 0
  fi
done