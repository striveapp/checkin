// @dart=2.9

import 'package:checkin/src/handlers/registerable_handler.dart';
import 'package:checkin/src/ui/pages/registry_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart' hide Router;

class RegistryHandler extends Handler implements RegisterableHandler {
  static final String lessonId = "lessonId";
  static final String date = "date";

  void registerRoute(FluroRouter router) {
    router.define(route, handler: this);
  }

  @override
  HandlerFunc get handlerFunc =>
      (BuildContext context, Map<String, List<String>> params) => RegistryPage(
            lessonId: params[lessonId][0],
            date: params[date][0],
          );

  String get route => "registry/:$date/:$lessonId";
}
