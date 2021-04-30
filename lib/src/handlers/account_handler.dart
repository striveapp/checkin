import 'package:checkin/src/handlers/registerable_handler.dart';
import 'package:checkin/src/ui/pages/account_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart' hide Router;

class AccountHandler extends Handler implements RegisterableHandler {
  final String errorMessage = "errorMessage";

  @override
  void registerRoute(FluroRouter router) {
    router.define(route, handler: this);
  }

  @override
  HandlerFunc get handlerFunc => (BuildContext context, Map<String, List<String>> params) =>
      AccountPage(errorMessage: params[errorMessage]?.first);

  String get route => "account";
}
