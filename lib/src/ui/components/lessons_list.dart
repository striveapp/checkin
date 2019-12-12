import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/ui/components/lesson_tile.dart';
import 'package:flutter/material.dart';

class LessonsList extends StatefulWidget {
  final List<Lesson> lessons;

  const LessonsList({
    Key key,
    @required this.lessons,
  }) : super(key: key);

  @override
  _LessonsListState createState() => _LessonsListState();
}

class _LessonsListState extends State<LessonsList> {
  @override
  Widget build(BuildContext context) {
    var attendedLessons = widget.lessons;

    return Card(
      key: Key('lessonsList'),
      margin: EdgeInsets.zero,
      child: Container(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.53),
          child: _hasAttendedLessons(attendedLessons)
              ? Container(
                  alignment: Alignment(0, 0),
                  child: Text(
                    "No attended lessons yet",
                    style: Theme.of(context).textTheme.display1,
                  ),
                )
              : Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView.separated(
                          separatorBuilder: (context, index) => Divider(
                                color: Colors.grey,
                              ),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: attendedLessons.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (index < attendedLessons.length) {
                              final lesson = attendedLessons[index];
                              return LessonTile(lesson: lesson);
                            }
                            return null;
                          }),
                    ),
                  ],
                )),
    );
  }

  bool _hasAttendedLessons(List<Lesson> attendedLessons) {
    return attendedLessons.length == 0;
  }
}
