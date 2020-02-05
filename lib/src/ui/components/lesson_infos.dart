import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/master.dart';
import 'package:checkin/src/ui/components/user_image.dart';
import 'package:flutter/material.dart';
import 'package:checkin/src/constants.dart' as constants;

class LessonInfos extends StatelessWidget {
  final Lesson lesson;

  static const String and = 'and';

  const LessonInfos({Key key, @required this.lesson}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: UserImage(
            userImage: lesson.masters.first.imageUrl,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "${lesson.timeStart} - ${lesson.timeEnd}",
              style: Theme.of(context)
                  .textTheme
                  .headline
                  .apply(color: Colors.black87),
            ),
            Text(
              "${constants.by.i18n} ${lesson.masters.first.name}",
              style: Theme.of(context).textTheme.subtitle,
            ),
            if (lesson.masters.length > 1)
              Text("${and.i18n} ${getOtherMasterNames(lesson.masters)}",
                  style: Theme.of(context).textTheme.subtitle),
          ],
        )
      ],
    );
  }

  String getOtherMasterNames(List<Master> masters) =>
      masters.skip(1).map((master) => master.name).join(", ");
}
