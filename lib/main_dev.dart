import 'dart:async';

import 'package:checkin/app_config.dart';
import 'package:checkin/main_common.dart';

Future<void> main() async {

  final config = AppConfig('dev');

  mainCommon(config);
}
