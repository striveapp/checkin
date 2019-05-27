import 'package:checkin/src/models/lesson.dart';
import 'package:flutter/material.dart';

class LessonsButtons extends StatefulWidget {
  final List<Lesson> lessons;

  LessonsButtons({
    Key key,
    @required this.lessons,
  }) : super(key: key);

  @override
  State<LessonsButtons> createState() => _LessonsButtonsState();
}

class _LessonsButtonsState extends State<LessonsButtons> {
  List<Lesson> get _lessons => widget.lessons;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 40.0),
        child: Column(
            children: _lessons.map((lesson) =>
                Container(
                    padding: EdgeInsets.only(top: 20.0),
                    child: ButtonTheme(
                        height: 50.0,
                        minWidth: 240.0,
                        buttonColor: Colors.indigo,
                        padding: const EdgeInsets.all(0.0),
                        child: RaisedButton(
                            child: Text(
                              "${lesson.timeStart} - ${lesson.timeEnd}",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontStyle: FontStyle.normal,
                                  fontFamily: 'Roboto',
                                  fontSize: 22.0
                              ),
                            ),
                            onPressed: () => _onLessonsButtonPressed(lesson)))))
                .toList()));
  }
}

_onLessonsButtonPressed(Lesson lesson) {
  // todo dobbiamo ricominciare da qui
  debugPrint('Lesson selected: $lesson');
}
