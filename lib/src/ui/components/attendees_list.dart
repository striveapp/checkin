import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:flutter/material.dart';

import 'attendee_tile.dart';

class AttendeesList extends StatelessWidget {
  final List<Attendee> attendeeList;

  const AttendeesList({
    Key key,
    @required this.attendeeList
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (this.attendeeList.length == 0) {
      return Card(
          child: Container(
        constraints: BoxConstraints.expand(width: 350.0, height: 250.0),
        alignment: Alignment(0, 0),
        child: Text(
          Localization.of(context).emptyClass,
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
        ),
      ));
    }

    return Card(
      child: Container(
        constraints: BoxConstraints.expand(width: 350.0, height: 250.0),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              if (index < this.attendeeList.length) {
                return AttendeeTile(attendee: this.attendeeList[index]);
              }
              return null;
            }),
      ),
    );
  }
}
