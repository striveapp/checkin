import 'package:checkin/src/models/lesson.dart';
import 'package:flutter/material.dart';

class LessonCard extends StatelessWidget {
  final Lesson lesson;

  LessonCard({
    Key key,
    @required this.lesson,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _onPressed;
    _onPressed = (lessonId) {
      Navigator.of(context).pushNamed('/registry', arguments: lessonId);
    };

    return Container(
        padding: EdgeInsets.only(top: 20.0),
        child: Column(
          children: <Widget>[
            ButtonTheme(
                height: 50.0,
                minWidth: 240.0,
                buttonColor: Colors.indigo,
                padding: const EdgeInsets.all(0.0),
                child: RaisedButton(
                    child: Text(
                      "${lesson.timeStart} - ${lesson.timeEnd}",
                      key: Key('${lesson.name}'),
                      style: TextStyle(
                          color: Colors.white,
                          fontStyle: FontStyle.normal,
                          fontFamily: 'Roboto',
                          fontSize: 22.0),
                    ),
                    onPressed: () => _onPressed(lesson.id))),
          ],
        ));
  }
}
