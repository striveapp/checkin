// @dart=2.9

import 'package:checkin/src/handlers/registerable_handler.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart' hide Router;

abstract class SimpleHandler extends Handler implements RegisterableHandler {
  String getRoute();

  Widget getHandlerFunction(Map<String, List<String>> params);

  Widget _getHandlerFunction(BuildContext context, Map<String, List<String>> params) {
    return getHandlerFunction(params);
  }

  @override
  void registerRoute(FluroRouter router) {
    router.define(route, handler: this);
  }

  @override
  HandlerFunc get handlerFunc => _getHandlerFunction;

  String get route => getRoute();
}
