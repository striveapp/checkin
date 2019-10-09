import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:flutter/material.dart';

import 'attendee_tile.dart';

class AttendeesList extends StatelessWidget {
  final List<Attendee> attendeeList;
  final bool isOwner;
  final String lessonId;
  final void Function(Attendee) removeAttendee;

  const AttendeesList({
    Key key,
    @required this.attendeeList,
    @required this.isOwner,
    @required this.lessonId,
    @required this.removeAttendee,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (attendeeList.length == 0) {
      return Card(
          key: Key('emptyClassCard'),
          child: Container(
            constraints: BoxConstraints.expand(height: 250.0),
            alignment: Alignment(0, 0),
            child: Text(
              Localization.of(context).emptyClass,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
            ),
          ));
    }
    return Card(
      child: Container(
        constraints: BoxConstraints.expand(height: 250.0),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: attendeeList.length,
            itemBuilder: (BuildContext context, int index) {
              if (index < attendeeList.length) {
                final attendee = attendeeList[index];
                return isOwner
                    ? Dismissible(
                        //TODO: this should be changed with ID instead
                        key: Key(attendee.email),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Colors.red,
                        ),
                        onDismissed: (direction) {
                          removeAttendee(attendee);
                        },
                        child: AttendeeTile(attendee: attendee))
                    : AttendeeTile(attendee: attendee);
              }
              return null;
            }),
      ),
    );
  }
}