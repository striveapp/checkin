#!/bin/sh

set -x

android_template="$(pwd)/android/app/google-services.json.template"
result_file="$(pwd)/android/app/google-services.json"

sed -i.bak "s/__ANDROID_FIREBASE_API_KEY__/${ANDROID_FIREBASE_API_KEY}/" ${android_template}
rm -rf "$android_template.bak"
mv ${android_template} ${result_file}

ios_template="$(pwd)/ios/Runner/GoogleService-Info.plist.template"
result_ios_file="$(pwd)/ios/Runner/GoogleService-Info.plist"

sed -i.bak "s/__IOS_FIREBASE_API_KEY__/${IOS_FIREBASE_API_KEY}/" ${ios_template}
rm -rf "${ios_template}.bak"
mv ${ios_template} ${result_ios_file}