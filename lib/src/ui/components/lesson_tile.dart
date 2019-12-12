import 'package:checkin/src/models/lesson.dart';
import 'package:flutter/material.dart';

class LessonTile extends StatelessWidget {
  final Lesson lesson;

  const LessonTile({
    Key key,
    @required this.lesson,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            key: Key("tile-${lesson.timestamp}"),
            leading: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(lesson.name, style: Theme.of(context).textTheme.subtitle.apply(fontWeightDelta: 2, fontSizeFactor: 1.5),),
            ),
            title: Column(
              children: <Widget>[
                Text(
                    "${lesson.weekDay}",
                    style: Theme.of(context).textTheme.subtitle
                ),
                Text(
                    "${lesson.timeStart} - ${lesson.timeEnd}",
                    style: Theme.of(context).textTheme.subtitle
                ),
                Text(
                    "By ${lesson.masters.length > 0 ? lesson.masters.first.name : "porcodio"}",
                    style: Theme.of(context).textTheme.subtitle
                ),
              ],
            ),
            onTap: () async {
              debugPrint("User tapped on ${lesson.name}");
              Navigator.of(context).pushNamed('registrty/${lesson.id}');
            },
          ),
        ),
      ],
    );
  }
}
