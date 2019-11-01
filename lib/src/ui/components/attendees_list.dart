import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/user.dart';
import 'package:flutter/material.dart';

import 'attendee_tile.dart';

class AttendeesList extends StatelessWidget {
  final bool isOwner;
  final bool isClassEmpty;
  final bool isUserInClass;
  final String lessonId;
  final List<Attendee> attendeesList;
  final User currentUser;
  final void Function(Attendee) removeAttendee;

  const AttendeesList({
    Key key,
    @required this.isOwner,
    @required this.isClassEmpty,
    @required this.isUserInClass,
    @required this.lessonId,
    @required this.attendeesList,
    @required this.currentUser,
    @required this.removeAttendee,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var attendeeListWithoutUser = attendeesList
        .where((attendee) => attendee.email != currentUser.email)
        .toList();

    return Card(
      key: this.isClassEmpty ? Key('emptyClassCard') : Key('attendeeList'),
      margin: EdgeInsets.zero,
      child: Container(
        constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height * 0.53),
        child: this.isClassEmpty
            ? Container(
                alignment: Alignment(0, 0),
                child: Text(
                  Localization.of(context).emptyClass,
                  style: Theme.of(context).textTheme.display1,
                ),
              )
            :
        Column(children: <Widget>[
          if(this.isUserInClass)
            Column(
              children: <Widget>[
                AttendeeTile(attendee: Attendee.fromUser(currentUser), isCurrent: true,),
                Divider()
              ],
            ),
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: attendeeListWithoutUser.length,
              itemBuilder: (BuildContext context, int index) {
                if (index < attendeeListWithoutUser.length) {
                  final attendee = attendeeListWithoutUser[index];
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
        ],)
      ),
    );
  }
}
