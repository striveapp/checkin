import 'package:checkin/src/config.dart' as config;
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/ui/components/user_image.dart';
import 'package:flutter/material.dart';

class LessonCard extends StatelessWidget {
  final Lesson lesson;

  LessonCard({
    Key key,
    @required this.lesson,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
          height: 180,
          padding: EdgeInsets.only(top: 15.0),
          child: Card(
              color: Colors.white,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding:
                    EdgeInsets.only(right: 20, left: 20, top: 16, bottom: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        UserImage(
                          userImage: lesson.masters[0].imageUrl,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                _capitalize(lesson.name),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline
                                    .apply(color: Colors.black87),
                              ),
                              Text("${lesson.timeStart} - ${lesson.timeEnd}",
                                  style: Theme.of(context).textTheme.subtitle)
                            ],
                          ),
                        ),
                      ],
                    ),
                    if (lesson.attendees.length > 0)
                      Padding(
                        padding: const EdgeInsets.only(top: 14),
                        child: Row(
                          children: <Widget>[
                            ...lesson.attendees
                                .take(5)
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
                                  "${Localization.of(context).andOthers} ${lesson.attendees.length - 5}",
                                  style: Theme.of(context).textTheme.display1)
                          ],
                        ),
                      ),
                    if (lesson.attendees.length == 0)
                      Text(
                        Localization.of(context).emptyClass,
                        style: Theme.of(context).textTheme.display1,
                      ),
                    LinearProgressIndicator(
                      value: _getFullPercentage(lesson.attendees.length),
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Theme.of(context).accentColor),
                      backgroundColor: Color(0x241B3FE3),
                    )
                  ],
                ),
              ))),
      onTap: () {
        Navigator.of(context).pushNamed('registry', arguments: lesson.id);
      },
    );
  }
}

String _capitalize(String s) => s[0].toUpperCase() + s.substring(1);

//TODO this should be configurable
double _getFullPercentage(int numberOfAttendees) =>
    (numberOfAttendees * 100 / config.CLASS_CAPACITY) / 100;
