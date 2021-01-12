import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/ui/components/lessons/accepted_badge.dart';
import 'package:checkin/src/ui/components/user_image.dart';
import 'package:flutter/material.dart';

class AttendeesPreview extends StatelessWidget {
  final Lesson lesson;
  final int maxAttendeesToDisplay;

  static const String andOthers = 'and %d other';

  AttendeesPreview({
    Key key,
    this.lesson,
    this.maxAttendeesToDisplay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Attendee> allAttendees = [
      ...lesson.attendees,
      ...lesson.acceptedAttendees
    ];
    final otherAttendeesNumber = allAttendees.length - maxAttendeesToDisplay;
    return Row(
      children: <Widget>[
        ...allAttendees
            .take(maxAttendeesToDisplay)
            .map((attendee) => Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Container(
                    child: lesson.acceptedAttendees.contains(attendee)
                        ? Stack(
                            alignment: AlignmentDirectional.bottomEnd,
                            clipBehavior: Clip.none,
                            children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1.5,
                                        color: Theme.of(context).accentColor),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(50)),
                                  ),
                                  child: UserImage(
                                    userImage: attendee.imageUrl,
                                    width: MediaQuery.of(context).size.width *
                                        0.06,
                                    height: MediaQuery.of(context).size.width *
                                        0.06,
                                  ),
                                ),
                                Positioned(
                                  right: -2,
                                  bottom: -2,
                                  child: AcceptedBadge(),
                                )
                              ])
                        : UserImage(
                            userImage: attendee.imageUrl,
                            width: MediaQuery.of(context).size.width * 0.06,
                            height: MediaQuery.of(context).size.width * 0.06,
                          ),
                  ),
                ))
            ?.toList(),
        if (allAttendees.length > 5)
          Text("${andOthers.plural(otherAttendeesNumber)}",
              style: Theme.of(context).textTheme.headline5)
      ],
    );
  }
}
