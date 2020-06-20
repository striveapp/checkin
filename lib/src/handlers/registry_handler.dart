import 'package:checkin/src/blocs/auth/auth_bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/handlers/registerable_handler.dart';
import 'package:checkin/src/repositories/image_repository.dart';
import 'package:checkin/src/repositories/storage_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/ui/pages/registry_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistryHandler extends Handler implements RegisterableHandler {
  static final String lessonId = "lessonId";
  static final String date = "date";

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
          child: RegistryPage(
              lessonId: params[lessonId][0], date: params[date][0]),
        );
      };

  String get route => "registry/:$date/:$lessonId";
}
