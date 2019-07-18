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
    var _onPressed = (lessonId) {
      Navigator.of(context).pushNamed('/registry', arguments: lessonId);
    };

    return Container(
      padding: EdgeInsets.only(top: 20.0),
      child: Card(
        color: Colors.indigoAccent,
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 65.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(capitalize(lesson.name),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Roboto',
                        fontSize: 22.0,
                      )
                  ),
                  Text("${lesson.timeStart} - ${lesson.timeEnd}",
                      style: TextStyle(
                        color: Colors.white,
                        fontStyle: FontStyle.normal,
                        fontFamily: 'Roboto',
                        fontSize: 18.0,
                      )
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: IconButton(
              key: Key(lesson.name),
              color: Colors.white,
              onPressed: () => _onPressed(lesson.id),
              icon: Icon(Icons.arrow_forward_ios),
            ),
          )
      ],
    ),
        )
    ,
    )
    );
  }
}

String capitalize(String s) => s[0].toUpperCase() + s.substring(1);