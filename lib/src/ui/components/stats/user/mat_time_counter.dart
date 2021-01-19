import 'package:checkin/src/config.dart' as config;
import 'package:checkin/src/constants.dart' as constants;

import 'package:checkin/src/localization/localization.dart';
import 'package:flutter/material.dart';

class MatTimeCounter extends StatelessWidget {
  final int counter;
  final String timeSpan;

  static const String matTime = 'Mat Time';
  static const String numHours = '%d hours';
  static const String hours = 'hours';
  static const String attendedClasses = 'You attended %d classes';
  static const String thisTimespan = 'this %s';

  MatTimeCounter({
    Key key,
    this.counter,
    this.timeSpan,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              counter.toString(),
              key: Key('matHours'),
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline1
                  .apply(fontSizeFactor: 3, color: Theme.of(context).accentColor),
            ),
            Text(
              hours.plural(counter),
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        ),
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    numHours.plural(0),
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  Text(numHours.plural(_getTotalMatTimeHours(timeSpan)),
                      style: Theme.of(context).textTheme.headline5),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            LinearProgressIndicator(
              value: _getAttendancePercentage(counter, timeSpan),
              valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).accentColor),
              backgroundColor: Theme.of(context).primaryColor.withAlpha(70),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "${attendedClasses.plural(counter)} ${thisTimespan.gender(timeSpan)}",
          style: Theme.of(context).textTheme.headline4.apply(fontWeightDelta: 2),
        )
      ],
    );
  }

  int _getTotalMatTimeHours(String timeSpan) {
    if (timeSpan == constants.WEEK) {
      return config.TOTAL_MAT_TIME_WEEK;
    } else if (timeSpan == constants.MONTH) {
      return config.TOTAL_MAT_TIME_MONTH;
    }
    return config.TOTAL_MAT_TIME_YEAR;
  }

  double _getAttendancePercentage(int counter, String timeSpan) {
    if (timeSpan == constants.WEEK) {
      return ((counter * 1.5) * 100 / config.TOTAL_MAT_TIME_WEEK) / 100;
    } else if (timeSpan == constants.MONTH) {
      return ((counter * 1.5) * 100 / config.TOTAL_MAT_TIME_MONTH) / 100;
    }
    return ((counter * 1.5) * 100 / config.TOTAL_MAT_TIME_YEAR) / 100;
  }
}
