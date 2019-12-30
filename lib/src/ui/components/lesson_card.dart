import 'package:checkin/src/config.dart' as config;
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/ui/components/attendees_preview.dart';
import 'package:checkin/src/ui/components/user_image.dart';
import 'package:checkin/src/util/dynamic_link_util.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

class LessonCard extends StatelessWidget {
  final Lesson lesson;

  LessonCard({
    Key key,
    @required this.lesson,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 180,
        padding: EdgeInsets.only(top: 15.0),
        child: Card(
            key: Key(lesson.name),
            color: Colors.white,
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("registry/${lesson.id}");
              },
              child: Padding(
                padding:
                    EdgeInsets.only(right: 20, left: 20, top: 16, bottom: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            UserImage(
                              userImage: lesson.masters.first.imageUrl,
                            ),
                            SizedBox(width: 20,),
                            Column(
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
                          ],
                        ),
                        IconButton(icon: Icon(Icons.share), onPressed: () async {
                          var link = await DynamicLinkUtil().getLink(lessonId: lesson.id);
                          Share.share(link);
                        },)
                      ],
                    ),
                    if (lesson.attendees.length > 0)
                      Padding(
                        padding: const EdgeInsets.only(top: 14),
                        child: AttendeesPreview(
                          lesson: lesson,
                          maxAttendeesToDisplay: 5,
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
              ),
            )));
  }
}

String _capitalize(String s) => s[0].toUpperCase() + s.substring(1);

//TODO this should be configurable
double _getFullPercentage(int numberOfAttendees) =>
    (numberOfAttendees * 100 / config.CLASS_CAPACITY) / 100;
