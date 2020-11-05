import 'package:checkin/src/constants.dart' as constants;
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/master.dart';
import 'package:checkin/src/ui/components/user_image.dart';
import 'package:flutter/material.dart';

class LessonInfos extends StatelessWidget {
  static const String and = 'and';
  final Lesson lesson;


  LessonInfos({@required this.lesson});

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
            Text(lesson.name, style: Theme.of(context).textTheme.headline5),
            Text(
                "${lesson.timeStart} - ${lesson.timeEnd}",
                style: Theme.of(context)
                    .textTheme
                    .headline2.apply(fontSizeDelta: 4)
            ),
            Text(
              "${constants.by.i18n} ${lesson.masters.first.name}",
              style: Theme.of(context).textTheme.headline3,
            ),
            if (lesson.masters.length > 1)
              Text("${and.i18n} ${_getOtherMasterNames(lesson.masters)}",
                  style: Theme.of(context).textTheme.headline3),
          ],
        )
      ],
    );
  }

  String _getOtherMasterNames(List<Master> masters) =>
      masters.skip(1).map((master) => master.name).join(", ");
}
