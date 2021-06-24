# checkin
[![Codemagic build status](https://api.codemagic.io/apps/5c6d213063e304000cb3f99c/tests-only/status_badge.svg)](https://api.codemagic.io/apps/5c6d213063e304000cb3f99c/tests-only/status_badge.svg)

Checkin is an app that allow a master to check-in attendees.

## Basic requirements

- [x] *App* should have a *Login*
- [x] *User* can see a counter of how many class he attends
- [x] *Master* can see all users counters
- [x] *Class* can have multiple *User*
- [x] *Master* can confirm *User* of the *Class*
- [x] *User* can claim his participation to a *Class*
- [x] *User* have *Ranks*
- [x] *Master* can promote *User*

## Technologies

- Flutter
- Firebase Auth for auth and roles/permission managements
- Firebase Functions for Serverless backend
- Firebase Storage for static files
- Firebase Cloudstore for DB


## Run integration tests

```bash
make integration-test
```

## While developing

You should setup you dev environment in the following way:

```bash
ENV=dev ./scripts/set_env.sh
```

## How to Build a prod apk
```
flutter build appbundle \
  --flavor prod \
  --release -t lib/main_prod.dart \
&& android-app-bundle build-universal-apk
```
