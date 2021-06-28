// @dart=2.9

import 'package:fluro/fluro.dart';

abstract class RegisterableHandler {
  void registerRoute(FluroRouter router);
}
