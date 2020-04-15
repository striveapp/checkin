import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/ui/components/user_image.dart';
import 'package:flutter/material.dart';
import 'package:checkin/src/models/grade.dart';

class AttendeeInfoCard extends StatelessWidget {
  final Attendee attendee;
  final int attendedLessons;

  AttendeeInfoCard({
    @required this.attendee,
    @required this.attendedLessons,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Flexible(
                      flex: 1,
                      child: UserImage(
                        userImage: attendee.imageUrl
                      )),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          attendee.name,
                          style: Theme.of(context)
                              .textTheme
                              .headline4
                              .apply(color: Colors.black87, fontWeightDelta: 2),
                        ),
                        Text(attendee.grade.name,
                            style: Theme.of(context)
                                .textTheme
                                .headline5
                                .apply(color: Colors.black87)),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      attendedLessons.toString(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline1
                          .apply(color: Theme.of(context).accentColor),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
