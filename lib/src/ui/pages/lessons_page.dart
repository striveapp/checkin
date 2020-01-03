import 'package:checkin/src/blocs/lessons/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:checkin/src/ui/components/base_app_bar.dart';
import 'package:checkin/src/ui/components/days_picker.dart';
import 'package:checkin/src/ui/components/lesson_card.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:checkin/src/ui/components/no_lessons_banner.dart';
import 'package:checkin/src/util/date_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(
          title: Localization.of(context).classes,
        ),
        body: BlocProvider<LessonsBloc>(
          create: (BuildContext context) => LessonsBloc(
            lessonRepository: LessonRepository(),
            dateUtil: DateUtil(),
          ),
          child: BlocBuilder<LessonsBloc, LessonsState>(
              builder: (BuildContext context, LessonsState state) {
            if (state is LessonsUninitialized) {
              return LoadingIndicator();
            }
            if (state is LessonsLoaded) {
              return Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          topRight: Radius.circular(10.0))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      DaysPicker(day: state.day),
                      Container(
                        child: Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: ListView(
                                children: state.lessons
                                    .map((lesson) => LessonCard(lesson: lesson))
                                    .toList()),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            if (state is LessonsLoadedEmpty) {
              return Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      DaysPicker(day: state.day),
                      NoLessonsBanner(),
                    ],
                  ),
                ),
              );
            }
            return ErrorWidget(
                'Unknown State [$state] received in: lesson_page');
          }),
        ));
  }
}
