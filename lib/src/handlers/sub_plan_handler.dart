import 'package:checkin/src/blocs/auth/auth_bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/handlers/registerable_handler.dart';
import 'package:checkin/src/repositories/image_repository.dart';
import 'package:checkin/src/repositories/storage_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/ui/pages/sub_plan_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart' hide Router;
import 'package:flutter_bloc/flutter_bloc.dart';

class SubPlanHandler extends Handler implements RegisterableHandler {
  static final String planId = "planId";
  static final String customerId = "customerId";
  static final String name = "name";
  static final String description = "description";

  @override
  void registerRoute(FluroRouter router) {
    router.define(route, handler: this);
  }

  @override
  HandlerFunc get handlerFunc => (BuildContext context, Map<String, List<String>> params) {
        UserRepository userRepository = RepositoryProvider.of<UserRepository>(context);

        return MultiBlocProvider(
          providers: [
            BlocProvider<UserBloc>(
              create: (BuildContext context) => UserBloc(
                userRepository: userRepository,
                storageRepository: context.read<StorageRepository>(),
                imageRepository: context.read<ImageRepository>(),
                authBloc: BlocProvider.of<AuthBloc>(context),
              ),
            ),
          ],
          child: SubPlanPage(
              customerId: params[customerId][0],
              planId: params[planId][0],
              name: params[name][0],
              description: params[description][0]),
        );
      };

  String get route => "subPlan/:$customerId/:$planId/:$name/:$description";
}
