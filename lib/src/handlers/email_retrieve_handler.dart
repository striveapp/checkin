import 'package:checkin/src/blocs/login/bloc.dart';
import 'package:checkin/src/handlers/registerable_handler.dart';
import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:checkin/src/repositories/auth_repository.dart';
import 'package:checkin/src/repositories/local_storage_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/ui/pages/email_retrieval_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart' hide Router;
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailRetrieveHandler extends Handler implements RegisterableHandler {
  static final String email = "email";

  @override
  void registerRoute(FluroRouter router) {
    router.define(route, handler: this);
  }

  @override
  HandlerFunc get handlerFunc =>
      (BuildContext context, Map<String, List<String>> params) {
        return BlocProvider(
            create: (BuildContext context) => LoginBloc(
                  authRepository: context.read<AuthRepository>(),
                  userRepository: context.read<UserRepository>(),
                  analyticsRepository: context.read<AnalyticsRepository>(),
                  localStorageRepository:
                      context.read<LocalStorageRepository>(),
                ),
            child: EmailRetrievePage(email: params[email]?.first));
      };

  String get route => "email-retrieve/:$email";
}
