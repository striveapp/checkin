import 'package:checkin/src/blocs/lessons/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/repositories/holidays_repository.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/ui/components/lessons/gym_app_bar.dart';
import 'package:checkin/src/ui/components/lessons/lesson_card_list.dart';
import 'package:checkin/src/ui/components/lessons/lesson_filter_fab.dart';
import 'package:checkin/src/ui/components/lessons/week_calendar.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonsPage extends StatelessWidget {
  static const String classes = 'Classes';

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LessonsBloc>(
          create: (BuildContext context) => LessonsBloc(
            lessonRepository: context.read<LessonRepository>(),
            userRepository: context.read<UserRepository>(),
            dateUtil: context.read(),
          )..add(InitializeLessons()),
        )
      ],
      child: Scaffold(
          appBar: GymAppBar(),
          // floatingActionButton: FloatingActionButton(
          //   child: Icon(Icons.add),
          //   onPressed: () {
          //     LessonInstancesProvider().createLesson("test", "2021-01-11");
          //   },
          // ),
          floatingActionButton: LessonsFilterFab(),
          body: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  BlocBuilder<UserBloc, UserState>(
                      builder: (BuildContext context, UserState state) {
                    return state.maybeMap(
                      userSuccess: (UserSuccess state) => WeekCalendar(
                        holidaysRepository: HolidaysRepository(),
                        currentUser: state.currentUser,
                        // https://stackoverflow.com/a/62333855/4349619
                        key: UniqueKey(),
                      ),
                      orElse: () => LoadingIndicator(),
                    );
                  }),
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
