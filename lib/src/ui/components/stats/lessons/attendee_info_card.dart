import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/ui/components/rounded_image.dart';
import 'package:flutter/material.dart';

class AttendeeInfoCard extends StatelessWidget {
  final Attendee attendee;
  final int attendedLessons;

  static const String beltColor = '%s Belt';

  AttendeeInfoCard({
    @required this.attendee,
    @required this.attendedLessons,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
      onTap: () {
        Navigator.of(context).pushNamed('stats/${attendee.email}');
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Flexible(flex: 1, child: RoundedImage(userImage: attendee.imageUrl)),
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
                        style: Theme.of(context).textTheme.headline4.apply(fontWeightDelta: 4),
                      ),
                      Text(beltColor.i18n.fill([attendee.grade.name.i18n]),
                          style: Theme.of(context).textTheme.headline5),
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
      ),
    ));
  }
}
