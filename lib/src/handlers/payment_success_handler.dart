import 'package:checkin/src/handlers/registerable_handler.dart';
import 'package:checkin/src/ui/pages/payment_success_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart' hide Router;

class PaymentSuccessHandler extends Handler implements RegisterableHandler {
  @override
  void registerRoute(Router router) {
    router.define(route, handler: this);
  }

  @override
  HandlerFunc get handlerFunc => (BuildContext context, Map<String, List<String>> params) {
    return PaymentSuccessPage();
  };

  String get route => "payment/success";
}