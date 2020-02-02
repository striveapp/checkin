import 'package:checkin/src/blocs/notifications/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/repositories/notification_repository.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:checkin/src/ui/components/notification_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'grade_page.dart';
import 'lessons_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotificationsBloc(
        userBloc: BlocProvider.of<UserBloc>(context),
        notificationRepository: NotificationRepository(),
      )..add(Setup()),
      child: BlocListener<NotificationsBloc, NotificationsState>(
        listener: (BuildContext context, NotificationsState state) {
          if (state is NotificationToDialog) {
            NotificationToast.show(
                context, state.notification.title, state.notification.body);
          }
          if(state is NotificationToNavigate) {
            debugPrint("notification received with path ${state.path}");
            Navigator.of(context).pushNamed(state.path);
          }
        },
        child: BlocBuilder<UserBloc, UserState>(
            builder: (BuildContext context, UserState state) {
          if (state is UserLoading) {
            return Scaffold(body: LoadingIndicator());
          }
          if (state is UserError) {
            return ErrorWidget("Unexpected UserError [$state]");
          }

          if (state is UserSuccess) {
            if (state.currentUser.grade == null) {
              return GradePage();
            }
            return LessonsPage();
          }
          return ErrorWidget("Unknown State [$state] received in: home_page");
        }),
      ),
    );
  }
}
