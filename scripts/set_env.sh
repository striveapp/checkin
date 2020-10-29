#!/bin/bash

set -e
trap 'echo "\"${BASH_COMMAND}\" command filed with exit code $?."' ERR

DB_ENV=${DB_ENV:-$FLAVOR}

### ANDROID
echo "Configuring Android for FLAVOR: ${FLAVOR} and DB_ENV : ${DB_ENV}"

android_template="$(pwd)/android/app/src/${FLAVOR}/google-services.json.${DB_ENV}.template"
result_file="$(pwd)/android/app/src/${FLAVOR}/google-services.json"

if [[ -z ${ANDROID_FIREBASE_API_KEY+x} ]]; then
    read -s -p "Insert Android API key: " android_api_key
    ANDROID_FIREBASE_API_KEY=${android_api_key}
    echo "\n✅   ANDROID_FIREBASE_API_KEY set!"
else
    echo "✅   ANDROID_FIREBASE_API_KEY found!"
fi

cp ${android_template} "${android_template}.tmp"
sed -i.bak "s/__ANDROID_FIREBASE_API_KEY__/${ANDROID_FIREBASE_API_KEY}/" ${android_template}
rm -rf "$android_template.bak"
mv ${android_template} ${result_file}
mv "${android_template}.tmp" ${android_template}
echo "✅   Done!\n"

### IOS SETUP
echo "Configuring IOS for ${FLAVOR}..."

ios_template="$(pwd)/ios/Runner/config/${FLAVOR}/GoogleService-Info.plist.${DB_ENV}.template"
result_ios_file="$(pwd)/ios/Runner/config/${FLAVOR}/GoogleService-Info.plist"


if [[ -z ${IOS_FIREBASE_API_KEY+x} ]]; then
    read -s -p "Insert Ios API key: " ios_api_key
    IOS_FIREBASE_API_KEY=${ios_api_key}
    echo "\n✅   IOS_FIREBASE_API_KEY set!"
else
    echo "✅   IOS_FIREBASE_API_KEY found!"
fi

cp ${ios_template} "${ios_template}.tmp"
sed -i.bak "s/__IOS_FIREBASE_API_KEY__/${IOS_FIREBASE_API_KEY}/" ${ios_template}
rm -rf "${ios_template}.bak"
mv ${ios_template} ${result_ios_file}
mv "${ios_template}.tmp" ${ios_template}
echo "✅   Done!"