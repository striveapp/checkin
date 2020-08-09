import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/ui/components/stats/user/lesson_info_card.dart';
import 'package:flutter/material.dart';

class AttendedLessonsList extends StatelessWidget {
  final List<Lesson> attendedLessons;

  static const String attendedClasses = 'Attended Classes';

  const AttendedLessonsList({
    Key key,
    @required this.attendedLessons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          AttendedLessonsList.attendedClasses.i18n,
          style: Theme.of(context).textTheme.headline1,
        ),
        ...attendedLessons
            .map((lesson) => LessonInfoCard(lesson: lesson))
            .toList(),
      ],
    );
  }
}
