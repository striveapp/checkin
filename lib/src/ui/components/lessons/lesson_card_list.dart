import 'package:checkin/src/blocs/lessons/bloc.dart';
import 'package:checkin/src/models/weekday.dart';
import 'package:checkin/src/ui/components/lessons/lesson_card.dart';
import 'package:checkin/src/ui/components/lessons/no_lessons_banner.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonCardList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonsBloc, LessonsState>(
        builder: (BuildContext context, LessonsState state) {
          if (state is LessonsLoaded) {
            if (state.lessons.length != 0) {
              return ListView.builder(
                padding: EdgeInsets.only(bottom: 50),
                key: Key("lessonCardList"),
                itemCount: state.lessons.length,
                itemBuilder: (BuildContext context, int index) {
                  var lesson = state.lessons[index];
                  return LessonCard(
                      key: Key("lesson_${lesson.weekDay.name}_$index"), lesson: lesson);
                });
            } else {
              return NoLessonsBanner();
            }
          }

          return LoadingIndicator();
        });
  }
}
