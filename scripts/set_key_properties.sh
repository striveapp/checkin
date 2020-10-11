#!/bin/bash

echo $CM_KEYSTORE | base64 --decode > /tmp/keystore.keystore
cat >> "$FCI_BUILD_DIR/android/key.properties" <<EOF
storePassword=$CM_KEYSTORE_PASSWORD
keyPassword=$CM_KEY_ALIAS_PASSWORD
keyAlias=$CM_KEY_ALIAS_USERNAME
storeFile=/tmp/keystore.keystore
EOF