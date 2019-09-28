import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';

abstract class SimpleHandler extends Handler {

  String getRoute();
  Widget getHandlerFunction(Map<String, List<String>> params);

  Widget _getHandlerFunction(BuildContext context, Map<String, List<String>> params) {
    return getHandlerFunction(params);
  }

  void registerRoute(Router router) {
    router.define(route, handler: this);
  }

  @override
  HandlerFunc get handlerFunc => _getHandlerFunction;

  String get route => getRoute();
}



