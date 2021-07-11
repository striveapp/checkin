// @dart=2.9

import 'package:checkin/src/handlers/registerable_handler.dart';
import 'package:checkin/src/ui/pages/public_profile_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart' hide Router;

class PublicProfileHandler extends Handler implements RegisterableHandler {
  static final String userEmail = "userEmail";

  @override
  void registerRoute(FluroRouter router) {
    router.define(route, handler: this);
  }

  @override
  HandlerFunc get handlerFunc =>
      (BuildContext context, Map<String, List<String>> params) => PublicProfilePage(
            userEmail: params[userEmail][0],
          );

  String get route => "profile/:$userEmail";
}
