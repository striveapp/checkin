import 'package:checkin/src/localization/localization.dart';
import 'package:flutter/material.dart';

class DaysPicker extends StatelessWidget {
  final String day;

  DaysPicker({
    Key key,
    this.day
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            Localization.of(context).today,
            key: Key('todaysClassesText'),
            style: Theme.of(context).textTheme.title,
          ),
          Text(
            day,
            style: Theme.of(context).textTheme.subtitle,
          ),
        ],
      ),
    );
  }
}
