import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class AppConfig {
  final String flavor;
  final String appUniqueIdentifier;
  final String dynamicLinkDomain;
  final String deepLinkUrl;
  final Logger logger;

  AppConfig({
    @required this.flavor,
    @required this.appUniqueIdentifier,
    @required this.dynamicLinkDomain,
    @required this.deepLinkUrl,
    @required this.logger,
  }) {
    switch (flavor) {
      case 'dev':
        logger.v("Environment: DEV");
        break;
      case 'prod':
        logger.v("Environment: PROD");
        break;
    }
  }
}
