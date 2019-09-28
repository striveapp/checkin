import 'package:checkin/src/handlers/handlers.dart';
import 'package:fluro/fluro.dart';


class Routes {
  static List<SimpleHandler> routeHandlers = [
    HomeHandler(),
    RegistryHandler(),
    ProfileHandler(),
  ];

  static void configureRoutes(Router router) {
    routeHandlers.forEach( (handler) => handler.registerRoute(router));
  }
}