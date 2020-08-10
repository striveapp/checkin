import 'package:checkin/src/blocs/auth/auth_bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/handlers/registerable_handler.dart';
import 'package:checkin/src/repositories/image_repository.dart';
import 'package:checkin/src/repositories/storage_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/ui/pages/account_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountHandler extends Handler implements RegisterableHandler {
  final String errorMessage = "errorMessage";

  @override
  void registerRoute(Router router) {
    router.define(route, handler: this);
  }

  @override
  HandlerFunc get handlerFunc =>
      (BuildContext context, Map<String, List<String>> params) {
        UserRepository userRepository = UserRepository();
        StorageRepository storageRepository = StorageRepository();
        ImageRepository imageRepository = ImageRepository();

        return BlocProvider<UserBloc>(
            create: (BuildContext context) {
              return UserBloc(
                userRepository: userRepository,
                storageRepository: storageRepository,
                imageRepository: imageRepository,
                authBloc: BlocProvider.of<AuthBloc>(context),
              );
            },
            child: AccountPage(errorMessage: params[errorMessage]?.first));
      };

  String get route => "account";
}
