import 'package:checkin/src/blocs/lessons/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/repositories/holidays_repository.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:checkin/src/ui/components/base_app_bar.dart';
import 'package:checkin/src/ui/components/lesson_card.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:checkin/src/ui/components/no_lessons_banner.dart';
import 'package:checkin/src/ui/components/week_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonsPage extends StatelessWidget {
  static const String classes = 'Classes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(
          title: classes.i18n,
        ),
        body: BlocProvider<LessonsBloc>(
          create: (BuildContext context) => LessonsBloc(
            lessonRepository: RepositoryProvider.of<LessonRepository>(context),
          ),
          child: Builder(
            builder: (BuildContext context) => Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    WeekCalendar(
                      holidaysRepository: HolidaysRepository(),
                      onDaySelected:
                          (DateTime selectedDay, List<dynamic> event) {
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
          ),
        ));
  }
}

class LessonCardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonsBloc, LessonsState>(
        builder: (BuildContext context, LessonsState state) {
      if (state is LessonsLoaded) {
        return ListView.builder(
            itemCount: state.lessons.length,
            itemBuilder: (BuildContext context, int index) {
              return LessonCard( key: Key("lesson_$index"), lesson: state.lessons[index]);
            });
      }

      if (state is LessonsUninitialized) {
        return LoadingIndicator();
      }
      if (state is LessonsLoadedEmpty) {
        return NoLessonsBanner();
      }
      return ErrorWidget(
          'Unknown State [$state] received in: lesson_card_list');
    });
  }
}
