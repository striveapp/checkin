import 'package:checkin/src/config.dart' as config;
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:flutter/material.dart';

class AttendeesCounter extends StatelessWidget {
  final List<Attendee> attendees;
  static const String full = 'full';

  const AttendeesCounter({Key key, @required this.attendees}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          "Attendees (${attendees.length})",
          style: Theme.of(context).textTheme.headline2,
        ),
        Text("${_getFullPercentage(attendees.length)} ${full.i18n}",
            style:
                Theme.of(context).textTheme.headline5.apply(fontWeightDelta: 3))
      ],
    );
  }

  //TODO this should be configurable
  String _getFullPercentage(int numberOfAttendees) =>
      (numberOfAttendees * 100 / config.CLASS_CAPACITY).toStringAsFixed(0) + "%";
}
