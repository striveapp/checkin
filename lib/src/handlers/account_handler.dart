import 'package:checkin/src/blocs/auth/auth_bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/handlers/registerable_handler.dart';
import 'package:checkin/src/repositories/image_repository.dart';
import 'package:checkin/src/repositories/storage_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/ui/pages/account_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart' hide Router;
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountHandler extends Handler implements RegisterableHandler {
  final String errorMessage = "errorMessage";

  @override
  void registerRoute(FluroRouter router) {
    router.define(route, handler: this);
  }

  @override
  HandlerFunc get handlerFunc => (BuildContext context, Map<String, List<String>> params) {
        UserRepository userRepository = RepositoryProvider.of<UserRepository>(context);

        return BlocProvider<UserBloc>(
            create: (BuildContext context) {
              return UserBloc(
                userRepository: userRepository,
                storageRepository: context.read<StorageRepository>(),
                imageRepository: context.read<ImageRepository>(),
                authBloc: BlocProvider.of<AuthBloc>(context),
              );
            },
            child: AccountPage(errorMessage: params[errorMessage]?.first));
      };

  String get route => "account";
}
