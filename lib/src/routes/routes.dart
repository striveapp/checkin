import 'package:checkin/src/handlers/account_handler.dart';
import 'package:checkin/src/handlers/handlers.dart';
import 'package:checkin/src/handlers/registerable_handler.dart';
import 'package:fluro/fluro.dart';


class Routes {
  static List<RegisterableHandler> routeHandlers = [
    HomeHandler(),
    RegistryHandler(),
    ProfileHandler(),
    AccountHandler(),
  ];

  static void configureRoutes(Router router) {
    routeHandlers.forEach( (handler) => handler.registerRoute(router));
  }
}