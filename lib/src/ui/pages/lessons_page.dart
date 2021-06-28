// @dart=2.9

import 'package:checkin/src/blocs/lessons/bloc.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/holidays_repository.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:checkin/src/repositories/lesson_template_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/ui/components/lessons/lesson_card_list.dart';
import 'package:checkin/src/ui/components/lessons/lesson_filter_fab.dart';
import 'package:checkin/src/ui/components/lessons/speed_dial_fab/speed_dial_fab.dart';
import 'package:checkin/src/ui/components/lessons/switch_gym_app_bar/gym_app_bar.dart';
import 'package:checkin/src/ui/components/lessons/week_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonsPage extends StatelessWidget {
  final User currentUser;
  static const String classes = 'Classes';

  const LessonsPage({Key key, this.currentUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LessonsBloc>(
      create: (BuildContext context) => LessonsBloc(
        lessonRepository: context.read<LessonRepository>(),
        lessonTemplateRepository: context.read<LessonTemplateRepository>(),
        userRepository: context.read<UserRepository>(),
        dateUtil: context.read(),
      )..add(InitializeLessons()),
      child: Scaffold(
          appBar: GymAppBar(),
          floatingActionButton: currentUser.isOwner ? SpeedDialFab() : LessonsFilterFab(),
          body: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  WeekCalendar(
                    holidaysRepository: HolidaysRepository(),
                    currentUser: currentUser,
                    // https://stackoverflow.com/a/62333855/4349619
                    key: UniqueKey(),
                  ),
                  Container(
                    child: Expanded(
                      child: LessonCardList(),
                    ),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
