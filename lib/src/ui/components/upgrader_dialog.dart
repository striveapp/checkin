// @dart=2.9

import 'package:checkin/src/constants.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:open_appstore/open_appstore.dart';

class UpgraderDialog {
  static final String update = "Update";
  static final String versionNotSupported =
      "Current version of this app is no longer supported\n\nPlease update now";

  static final UpgraderDialog _singleton = new UpgraderDialog._internal();

  factory UpgraderDialog() {
    return _singleton;
  }

  static void show(BuildContext context) {
    UpgraderDialog.createView(context);
  }

  UpgraderDialog._internal();

  static OverlayState overlayState;
  static OverlayEntry _containerEntry;
  static OverlayEntry _dialogEntry;

  static void createView(BuildContext context) async {
    overlayState = Overlay.of(context);

    _containerEntry = new OverlayEntry(
        builder: (BuildContext context) => Container(
              constraints: BoxConstraints.expand(),
              color: Colors.black54,
            ));
    _dialogEntry = new OverlayEntry(
        builder: (BuildContext context) => AlertDialog(actions: <Widget>[
              ElevatedButton(
                child: Text(update.i18n),
                onPressed: () {
                  OpenAppstore.launch(androidAppId: ANDROID_APP_ID, iOSAppId: IOS_APP_ID);
                },
              )
            ], title: Text(versionNotSupported.i18n)));
    overlayState.insertAll([_containerEntry, _dialogEntry]);
  }
}
