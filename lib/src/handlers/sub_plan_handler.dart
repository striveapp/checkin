// @dart=2.9

import 'package:checkin/src/handlers/registerable_handler.dart';
import 'package:checkin/src/ui/pages/sub_plan_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart' hide Router;

class SubPlanHandler extends Handler implements RegisterableHandler {
  static final String planId = "planId";
  static final String customerId = "customerId";
  static final String name = "name";
  static final String description = "description";

  @override
  void registerRoute(FluroRouter router) {
    router.define(route, handler: this);
  }

  @override
  HandlerFunc get handlerFunc =>
      (BuildContext context, Map<String, List<String>> params) => SubPlanPage(
          customerId: params[customerId][0],
          planId: params[planId][0],
          name: params[name][0],
          description: params[description][0]);

  String get route => "subPlan/:$customerId/:$planId/:$name/:$description";
}
