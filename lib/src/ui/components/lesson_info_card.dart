import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:checkin/src/constants.dart' as constants;

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
            color: Colors.white,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Padding(
              padding:
                  EdgeInsets.only(right: 20, left: 10, top: 16, bottom: 16),
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
                                  .headline
                                  .apply(color: Theme.of(context).accentColor),
                            ),
                            Text(
                              _getMonthThreeLetter(lesson.timestamp),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline
                                  .apply(color: Theme.of(context).accentColor),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "${_capitalize(lesson.name)}",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline
                                  .apply(color: Colors.black87),
                            ),
                            Text("${constants.by.i18n} ${lesson.masters.first.name}",
                                style: Theme.of(context).textTheme.subtitle),
                            Text(
                                "${lesson.weekDay} (${lesson.timeStart} - ${lesson.timeEnd})",
                                style: Theme.of(context).textTheme.subtitle)
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

String _capitalize(String s) => s[0].toUpperCase() + s.substring(1);

String _getDayNumber(int timestamp) =>
    DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000).day.toString();

String _getMonthThreeLetter(int timestamp) => DateFormat('MMM')
    .format(DateTime.fromMicrosecondsSinceEpoch(timestamp * 1000));
