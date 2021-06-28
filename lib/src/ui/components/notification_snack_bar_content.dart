// @dart=2.9

import 'package:flutter/material.dart';

class NotificationSnackBarContent extends StatelessWidget {
  final String title;
  final String body;

  NotificationSnackBarContent({this.title, this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .textTheme
                .headline4
                .apply(color: Theme.of(context).colorScheme.secondary, fontWeightDelta: 2),
          ),
          Text(
            body,
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .textTheme
                .headline5
                .apply(color: Theme.of(context).colorScheme.secondary),
          ),
        ],
      ),
    );
  }
}
