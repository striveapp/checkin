import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/user.dart';
import 'package:flutter/material.dart';

import 'attendee_tile.dart';

class CurrentUserTile extends StatelessWidget {
  final User currentUser;
  final List<Attendee> acceptedAttendees;

  const CurrentUserTile({
    Key key,
    @required this.currentUser,
    @required this.acceptedAttendees,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        AttendeeTile(
          attendee: Attendee.fromUser(currentUser),
          isCurrent: true,
          isOwnerView: true,
          isAccepted: acceptedAttendees
              .any((attendee) => attendee.email == currentUser.email),
        ),
        Divider()
      ],
    );
  }
}
