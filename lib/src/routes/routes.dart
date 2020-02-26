import 'package:checkin/src/handlers/account_handler.dart';
import 'package:checkin/src/handlers/handlers.dart';
import 'package:checkin/src/handlers/payment_success_handler.dart';
import 'package:checkin/src/handlers/registerable_handler.dart';
import 'package:checkin/src/handlers/stats_handler.dart';
import 'package:checkin/src/handlers/subscriptions_handler.dart';
import 'package:fluro/fluro.dart';


class Routes {
  static List<RegisterableHandler> routeHandlers = [
    HomeHandler(),
    RegistryHandler(),
    ProfileHandler(),
    AccountHandler(),
    SubscriptionsHandler(),
    PaymentSuccessHandler(),
    StatsHandler(),
  ];


  static void configureRoutes(Router router) {
    routeHandlers.forEach( (handler) => handler.registerRoute(router));
  }
}