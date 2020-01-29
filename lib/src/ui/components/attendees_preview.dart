import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/lesson.dart';
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
    final otherAttendeesNumber = lesson.attendees.length - maxAttendeesToDisplay;
    return Row(
      children: <Widget>[
        ...lesson.attendees
            .take(maxAttendeesToDisplay)
            .map((attendee) => Padding(
          padding: const EdgeInsets.only(right: 10),
          child: UserImage(
            userImage: attendee.imageUrl,
            width: MediaQuery.of(context).size.width * 0.06,
            height: MediaQuery.of(context).size.width * 0.06,
          ),
        ))
            ?.toList(),
        if (lesson.attendees.length > 5)
          Text(
              "${andOthers.plural(otherAttendeesNumber)}",
              style: Theme.of(context).textTheme.display1)
      ],
    );
  }

}
