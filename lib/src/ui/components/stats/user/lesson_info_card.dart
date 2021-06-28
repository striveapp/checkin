import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/weekday.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LessonInfoCard extends StatelessWidget {
  final Lesson lesson;

  LessonInfoCard({
    Key key,
    @required this.lesson,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 15.0),
        child: Card(
            key: Key(lesson.name),
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Padding(
              padding: EdgeInsets.only(right: 20, left: 10, top: 16, bottom: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: <Widget>[
                            Text(
                              _getDayNumber(lesson.timestamp),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  .apply(color: Theme.of(context).colorScheme.secondary),
                            ),
                            Text(
                              _getMonthThreeLetter(lesson.timestamp),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline1
                                  .apply(color: Theme.of(context).colorScheme.secondary),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("${_capitalize(lesson.name)}",
                                style: Theme.of(context).textTheme.headline1),
                            if (lesson.masters.isNotEmpty)
                              Text(lesson.masters.first.name,
                                  style: Theme.of(context).textTheme.headline3),
                            Text(
                                _formattedLessonInformation(
                                  weekDay: lesson.weekDay,
                                  timeStart: lesson.timeStart,
                                  timeEnd: lesson.timeEnd,
                                ),
                                style: Theme.of(context).textTheme.headline3)
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )));
  }
}

String _formattedLessonInformation({
  Weekday weekDay,
  String timeStart,
  String timeEnd,
}) =>
    "${weekDay.name} (${timeStart}${timeEnd.isNotEmpty ? " - ${timeEnd}" : ""})";

String _capitalize(String s) => s[0].toUpperCase() + s.substring(1);

String _getDayNumber(int timestamp) =>
    DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000).day.toString();

String _getMonthThreeLetter(int timestamp) =>
    DateFormat('MMM').format(DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000));
