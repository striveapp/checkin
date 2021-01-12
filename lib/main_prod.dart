import 'dart:async';

import 'package:checkin/app_config.dart';
import 'package:checkin/main_common.dart';

Future<void> main() async {
  final config = AppConfig(
    flavor: 'prod',
    appUniqueIdentifier: 'com.arya.checkin',
    dynamicLinkDomain: 'striveapp.page.link',
    deepLinkUrl: 'https://checkin-b7e8d.firebaseapp.com',
  );

  mainCommon(config);
}
