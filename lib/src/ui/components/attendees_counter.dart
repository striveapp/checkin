import 'package:checkin/src/models/attendee.dart';
import 'package:flutter/material.dart';

class AttendeesCounter extends StatelessWidget {
  final List<Attendee> attendees;

  const AttendeesCounter({Key key, @required this.attendees}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          "Attendees (${attendees.length})",
          style: Theme.of(context).textTheme.title,
        ),
        Text("${_getFullPercentage(attendees.length)} full",
            style:
                Theme.of(context).textTheme.display1.apply(fontWeightDelta: 3))
      ],
    );
  }

  //TODO this should be configurable
  String _getFullPercentage(int numberOfAttendees) =>
      (numberOfAttendees * 100 / 20).toStringAsFixed(0) + "%";
}
