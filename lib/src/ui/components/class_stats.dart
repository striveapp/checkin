import 'package:checkin/src/config.dart' as config;
import 'package:checkin/src/localization/localization.dart';
import 'package:flutter/material.dart';

class ClassStats extends StatelessWidget {
  final int counter;
  final String timeSpan;

  ClassStats({
    Key key,
    this.counter,
    this.timeSpan,
  }) : super(key: key);

  //TODO: internationalize strings
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            width: 155,
            child: Row(
              children: <Widget>[
                Icon(Icons.timer),
                SizedBox(
                  width: 5,
                ),
                Text(
                  Localization.of(context).matTime,
                  style: Theme.of(context)
                      .textTheme
                      .headline
                      .apply(color: Colors.black87),
                ),
              ],
            ),
          ),
          Text(
            getHourFromClasses(counter),
            key: Key('matHours'),
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
                    Text(
                      "0 ${Localization.of(context).hours}",
                      style: Theme.of(context).textTheme.display1,
                    ),
                    Text(
                        "${config.TOTAL_MAT_TIME_WEEK} ${Localization.of(context).hours}",
                        style: Theme.of(context).textTheme.display1),
                  ],
                ),
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
            "${Localization.of(context).youAttended} $counter ${Localization.of(context).classesThis} ${Localization.of(context).getValue(timeSpan)}",
            style: Theme.of(context).textTheme.body1.apply(fontWeightDelta: 2),
          )
        ],
      ),
    );
  }

  double getAttendancePercentage(int counter) {
    return ((counter * 1.5) * 100 / config.TOTAL_MAT_TIME_WEEK) / 100;
  }

  String getHourFromClasses(int counter) {
    return (counter * 1.5).floor().toString();
  }
}
