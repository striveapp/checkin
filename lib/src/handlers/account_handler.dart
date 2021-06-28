// @dart=2.9

import 'package:checkin/src/handlers/registerable_handler.dart';
import 'package:checkin/src/ui/pages/account_page.dart';
import 'package:checkin/src/ui/pages/account_page2.dart';
import 'package:checkin/src/util/debug_util.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart' hide Router;

class AccountHandler extends Handler implements RegisterableHandler {
  final String errorMessage = "errorMessage";

  @override
  void registerRoute(FluroRouter router) {
    router.define(route, handler: this);
  }

  @override
  HandlerFunc get handlerFunc =>
      (BuildContext context, Map<String, List<String>> params) => isInDebugMode
          ? AccountPage2()
          : AccountPage(
              errorMessage: params[errorMessage]?.first,
            );

  String get route => "account";
}
