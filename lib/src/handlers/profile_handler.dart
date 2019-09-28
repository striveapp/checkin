import 'package:checkin/src/handlers/simple_handler.dart';
import 'package:checkin/src/ui/pages/profile_page.dart';
import 'package:flutter/widgets.dart';

class ProfileHandler extends SimpleHandler {
  static final String email = "email";

  @override
  Widget getHandlerFunction(Map<String, List<String>> params) {
    return ProfilePage(email: params[email][0]);
  }

  @override
  String getRoute() {
    return "profile/:$email";
  }
}