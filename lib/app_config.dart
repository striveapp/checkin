import 'package:flutter/material.dart';

class AppConfig {
  final String flavor;
  final String appUniqueIdentifier;
  final String dynamicLinkDomain;
  final String deepLinkUrl;

  AppConfig({
    @required this.flavor,
    @required this.appUniqueIdentifier,
    @required this.dynamicLinkDomain,
    @required this.deepLinkUrl,
  }) {
    switch (flavor) {
      case 'dev':
        print("DEV app");
        break;
      case 'prod':
        print("PROD app");
        break;
    }
  }
}
