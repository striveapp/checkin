// @dart=2.9

import 'package:checkin/src/handlers/registerable_handler.dart';
import 'package:checkin/src/ui/pages/plans_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';

class PlansHandler extends Handler implements RegisterableHandler {
  static final String customerId = "customerId";

  @override
  void registerRoute(FluroRouter router) {
    router.define(route, handler: this);
  }

  @override
  HandlerFunc get handlerFunc => (BuildContext context, Map<String, List<String>> params) =>
      PlansPage(customerId: params[customerId][0]);

  String get route => "plans/:$customerId";
}
