import 'package:checkin/src/handlers/simple_handler.dart';
import 'package:checkin/src/ui/pages/registry_page.dart';
import 'package:flutter/widgets.dart';

class RegistryHandler extends SimpleHandler {
  @override
  Widget getHandlerFunction(Map<String, List<String>> params) {
    return RegistryPage();
  }

  @override
  String getRoute() {
    return "registry";
  }
}