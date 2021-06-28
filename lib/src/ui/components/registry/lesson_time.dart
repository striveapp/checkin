// @dart=2.9

import 'package:checkin/src/localization/localization.dart';
import 'package:flutter/material.dart';

class LessonTime extends StatelessWidget {
  static const String startingAt = 'Starting at %s';
  final String timeStart;
  final String timeEnd;
  final bool isClosed;

  const LessonTime({
    Key key,
    @required this.timeStart,
    this.timeEnd,
    this.isClosed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return timeEnd.isEmpty
        ? Text(
            startingAt.i18n.fill([timeStart]),
            style: Theme.of(context).textTheme.bodyText1.apply(
                  fontSizeDelta: 6,
                  color: isClosed ? Theme.of(context).disabledColor : null,
                ),
          )
        : Text(
            _formattedLessonTime(
              timeStart: timeStart,
              timeEnd: timeEnd,
            ),
            style: Theme.of(context).textTheme.headline2.apply(
                  fontSizeDelta: 4,
                  color: isClosed ? Theme.of(context).disabledColor : null,
                ),
          );
  }

  String _formattedLessonTime({
    String timeStart,
    String timeEnd,
  }) =>
      "${timeStart} - ${timeEnd}";
}
