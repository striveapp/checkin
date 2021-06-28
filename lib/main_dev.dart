// @dart=2.9

import 'dart:async';

import 'package:checkin/app_config.dart';
import 'package:checkin/main_common.dart';
import 'package:checkin/src/logging/dev_logger.dart';

Future<void> main() async {
  final config = AppConfig(
    flavor: 'dev',
    appUniqueIdentifier: 'com.arya.checkin.dev',
    dynamicLinkDomain: 'arya.page.link',
    deepLinkUrl: 'https://checkin-test-fba3d.web.app',
    logger: DevLogger.logger,
    // useEmulator: true,
  );

  mainCommon(config);
}
