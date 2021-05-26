import 'package:checkin/src/handlers/account_handler.dart';
import 'package:checkin/src/handlers/handlers.dart';
import 'package:checkin/src/handlers/payment_success_handler.dart';
import 'package:checkin/src/handlers/sub_plan_handler.dart';
import 'package:checkin/src/handlers/registerable_handler.dart';
import 'package:checkin/src/handlers/stats_handler.dart';
import 'package:fluro/fluro.dart';

class Routes {
  static List<RegisterableHandler> routeHandlers = [
    HomeHandler(),
    RegistryHandler(),
    AccountHandler(),
    PlansHandler(),
    SubPlanHandler(),
    PaymentSuccessHandler(),
    StatsHandler(),
    EmailRetrieveHandler(),
    NewsHandler()
  ];

  static void configureRoutes(FluroRouter router) {
    routeHandlers.forEach((handler) => handler.registerRoute(router));
  }
}
