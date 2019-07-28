#!/bin/sh

set -e
trap 'echo "\"${BASH_COMMAND}\" command filed with exit code $?."' ERR

### ANDROID
echo "Configuring Android for ${ENV}..."

android_template="$(pwd)/android/app/google-services.json.${ENV}.template"
result_file="$(pwd)/android/app/google-services.json"

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
echo "Configuring IOS for ${ENV}..."

ios_template="$(pwd)/ios/Runner/GoogleService-Info.plist.${ENV}.template"
result_ios_file="$(pwd)/ios/Runner/GoogleService-Info.plist"


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