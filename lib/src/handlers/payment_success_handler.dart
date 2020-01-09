import 'package:checkin/src/handlers/registerable_handler.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

class PaymentSuccessHandler extends Handler implements RegisterableHandler {
  @override
  void registerRoute(Router router) {
    router.define(route, handler: this);
  }

  @override
  HandlerFunc get handlerFunc => (BuildContext context, Map<String, List<String>> params) {
    // todo extract success page
    return Container(child: Text("Payment Success!"),);
  };

  String get route => "payment/success";
}