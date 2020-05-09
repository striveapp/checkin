import 'package:checkin/src/blocs/auth/auth_bloc.dart';
import 'package:checkin/src/blocs/gym/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/handlers/registerable_handler.dart';
import 'package:checkin/src/repositories/gym_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/resources/gym_provider.dart';
import 'package:checkin/src/ui/pages/subscriptions_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constants.dart';

class SubscriptionsHandler extends Handler implements RegisterableHandler {
  static final String email = "email";

  @override
  void registerRoute(Router router) {
    router.define(route, handler: this);
  }

  @override
  HandlerFunc get handlerFunc =>
      (BuildContext context, Map<String, List<String>> params) {
        UserRepository userRepository = UserRepository();
        GymRepository gymRepository = GymProvider();

        return MultiBlocProvider(
          providers: [
            BlocProvider<UserBloc>(
              create: (BuildContext context) => UserBloc(
                userRepository: userRepository,
                authBloc: BlocProvider.of<AuthBloc>(context),
              ),
            ),
            BlocProvider<GymBloc>(
              //todo: multigym
              create: (BuildContext context) => GymBloc(
                gymId: aranha_gym,
                gymRepository: gymRepository,
              ),
            ),
          ],
          child: SubscriptionsPage(customerEmail: params[email][0]),
        );
      };

  String get route => "subscriptions/:$email";
}
