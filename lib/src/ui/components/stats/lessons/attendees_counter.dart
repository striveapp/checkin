import 'package:flutter/material.dart';

class AttendeesCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
            Text(
              5.toString(),
              key: Key('matHours'),
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1.apply(
                  fontSizeFactor: 3, color: Theme.of(context).accentColor),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'students accepted',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .apply(fontWeightDelta: 2),
            )]
    );
  }
}