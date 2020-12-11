import 'package:checkin/src/blocs/lessons/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/repositories/holidays_repository.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:checkin/src/ui/components/base_app_bar.dart';
import 'package:checkin/src/ui/components/lessons/lesson_card_list.dart';
import 'package:checkin/src/ui/components/lessons/lesson_filter_fab.dart';
import 'package:checkin/src/ui/components/week_calendar.dart';
import 'package:checkin/src/util/debug_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonsPage extends StatelessWidget {
  static const String classes = 'Classes';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LessonsBloc(
        userBloc: BlocProvider.of<UserBloc>(context),
        lessonRepository: RepositoryProvider.of<LessonRepository>(context),
      ),
      child: Builder(
        builder: (BuildContext context) {
          return Scaffold(
              appBar: BaseAppBar(
                title: classes.i18n,
              ),
              floatingActionButton: isInDebugMode
                  ? LessonsFilterFab()
                  : null,
              body: Builder(
                builder: (BuildContext context) => Padding(
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
                          onDaySelected:
                              (DateTime selectedDay, List<dynamic> event, List<dynamic> holidays) {
                            BlocProvider.of<LessonsBloc>(context)
                                .add(LoadLessons(selectedDay: selectedDay));
                          },
                        ),
                        Container(
                          child: Expanded(
                            child: LessonCardList(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
