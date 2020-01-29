import 'package:checkin/src/blocs/auth/auth_bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/handlers/registerable_handler.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/ui/pages/profile_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileHandler extends Handler implements RegisterableHandler {
  static final String email = "email";

  @override
  void registerRoute(Router router) {
    router.define(route, handler: this);
  }

  @override
  HandlerFunc get handlerFunc => (BuildContext context, Map<String, List<String>> params) {
    UserRepository userRepository = UserRepository();

    return BlocProvider<UserBloc>(
        create: (BuildContext context) {
          return UserBloc(
          userRepository: userRepository,
          authBloc: BlocProvider.of<AuthBloc>(context),
        );
        },child: ProfilePage(userRepository: userRepository, email: params[email][0])
    );
  };

  String get route => "profile/:$email";
}