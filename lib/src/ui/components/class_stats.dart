import 'package:checkin/src/config.dart' as config;
import 'package:flutter/material.dart';

class ClassStats extends StatelessWidget {
  final int counter;

  ClassStats({Key key, this.counter}) : super(key: key);
  //TODO: internationalize strings
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Mat Time',
          style: Theme.of(context)
              .textTheme
              .headline
              .apply(color: Colors.black87),
        ),
        Text(
          getHourFromClasses(counter),
          key: Key('classCounter'),
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headline
              .apply(fontSizeFactor: 4, color: Theme.of(context).accentColor),
        ),
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("0 hours", style: Theme.of(context).textTheme.display1,),
                  Text("${config.TOTAL_MAT_TIME_WEEK} hours", style: Theme.of(context).textTheme.display1),
                ],),
            ),
            SizedBox(
              height: 5,
            ),
            LinearProgressIndicator(
              value: getAttendancePercentage(counter),
              valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).accentColor),
              backgroundColor: Color(0x241B3FE3),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "You attended $counter classes this week",
          style: Theme.of(context).textTheme.body1.apply(fontWeightDelta: 2),
        )
      ],
    );
  }

  double getAttendancePercentage(int counter) {
    return ((counter * 1.5) * 100 / config.TOTAL_MAT_TIME_WEEK) / 100;
  }

  String getHourFromClasses(int counter) {
    return (counter * 1.5).floor().toString();
  }
}
