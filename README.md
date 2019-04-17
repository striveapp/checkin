# checkin
[![Codemagic build status](https://api.codemagic.io/apps/5c6d213063e304000cb3f99c/5c6d213063e304000cb3f99b/status_badge.svg)](https://codemagic.io/apps/5c6d213063e304000cb3f99c/5c6d213063e304000cb3f99b/latest_build)

Checkin is an app that allow a team master to checkin attendees.

## Basic requirements

- [ ] *App* should have a *Login*
- [ ] *Master* can add *User* of his *Team* to the list
- [ ] *User* can see a counter of how many class he attends
- [ ] *Master* can see all users of his *Team* counters
- [ ] *Master* should have a *Team*
- [ ] *User* should have a *Team*
- [ ] *Master* can approve people on the *Team*
- [ ] *User* can ask to join a *Team*
- [ ] *Team* can have a *Class* schedule
- [ ] *Class* can have multiple *User*
- [ ] *Master* can confirm *User* of the *Class*
- [ ] *User* can claim his participation to a *Class*
- [ ] *User* have *Ranks*
- [ ] *Master* can assign *Ranks*
- [ ] *Team* can have *Ranks*
- [ ] *User* can propose his rank to *Master*
- [ ] *Master* can approve proposed *Rank*

## ER model

[Diagram](https://www.draw.io/#G1u4qTjqUVBixVnawTdAfQVT1Fgo91RYWb)

## Technologies

- Flutter
- IOS & Android config files
- Firebase Auth for auth and roles/permission managements
- Firebase Functions for ServerLess backend
- Firebase Storage for static files
- Firebase Cloud Firestore for DB

## Security notes

This app requires to have [git-secret](https://git-secret.io/installation) installed:

1. Open an issue asking to be added as trusted user.
1. Paste your public GPG Key into the issue and wait for confirmation.
1. run `git secret reveal`

## Emulator Alternative
Android screen mirroring command:
```bash
# find device id
$ flutter devices
2 connected devices:

SM G960F     • 2c7af66d1d017ece    • android-arm64 • Android 9 (API 28)
Google Pixel • 192.168.57.101:5555 • android-x86   • Android 9 (API 28)

$ adb -s 2c7af66d1d017ece shell screenrecord --output-format=h264 - | ffplay -
```