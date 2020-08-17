import 'package:checkin/src/handlers/simple_handler.dart';
import 'package:checkin/src/ui/pages/home_page.dart';
import 'package:flutter/widgets.dart' hide Router;

class HomeHandler extends SimpleHandler {
  @override
  Widget getHandlerFunction(Map<String, List<String>> params) {
    return HomePage();
  }

  @override
  String getRoute() {
    return "home";
  }
}