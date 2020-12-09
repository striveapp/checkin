import 'dart:async';

import 'package:checkin/app_config.dart';
import 'package:checkin/main_common.dart';

Future<void> main() async {
  final config = AppConfig(
      flavor: 'dev',
      appUniqueIdentifier: 'com.arya.checkin.dev',
      dynamicLinkDomain: 'arya.page.link',
      deepLinkUrl: 'https://checkin-test-fba3d.web.app',
  );

  mainCommon(config);
}
