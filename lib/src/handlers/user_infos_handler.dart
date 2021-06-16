import 'package:checkin/src/handlers/registerable_handler.dart';
import 'package:checkin/src/ui/pages/user_info_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart' hide Router;

class UserInfoHandler extends Handler implements RegisterableHandler {
  static final String userEmail = "userEmail";

  @override
  void registerRoute(FluroRouter router) {
    router.define(route, handler: this);
  }

  @override
  HandlerFunc get handlerFunc =>
      (BuildContext context, Map<String, List<String>> params) => UserInfoPage(
            userEmail: params[userEmail][0],
          );

  String get route => "user_info/:$userEmail";
}
