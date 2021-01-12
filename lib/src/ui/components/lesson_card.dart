import 'package:checkin/src/blocs/dynamic_link/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/ui/components/lessons/attendees_preview.dart';
import 'package:checkin/src/ui/components/lessons/lesson_type_badge.dart';
import 'package:checkin/src/ui/components/user_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonCard extends StatelessWidget {
  static const String emptyClass = 'Nobody in class yet';
  static const String startingAt = 'Starting at %s';

  final Lesson lesson;

  LessonCard({
    Key key,
    @required this.lesson,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var allAttendees =
        lesson.attendees.length + lesson.acceptedAttendees.length;
    return Container(
        constraints: BoxConstraints(minHeight: 180),
        padding: EdgeInsets.only(top: 15.0),
        child: Card(
            key: Key(lesson.name),
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: () {
                Navigator.of(context)
                    .pushNamed("registry/${lesson.date}/${lesson.id}");
              },
              child: Padding(
                padding:
                    EdgeInsets.only(right: 20, left: 20, top: 16, bottom: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          children: [
                            UserImage(
                              userImage: lesson.imageUrl,
                            ),
                            if (lesson.lessonConfig != null)
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: LessonTypeBadge(
                                  lessonType: lesson.lessonConfig.type,
                                  color: lesson.lessonConfig.color,
                                ),
                              ),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                _capitalize(lesson.name),
                                overflow: TextOverflow.fade,
                                softWrap: false,
                                style: Theme.of(context).textTheme.headline1,
                              ),
                              Text(
                                  _formattedLessonInformation(
                                    timeStart: lesson.timeStart,
                                    timeEnd: lesson.timeEnd,
                                  ),
                                  style: Theme.of(context).textTheme.headline3),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            icon: Icon(Icons.share),
                            onPressed: () => context
                                .read<DynamicLinkBloc>()
                                .add(ShareRegistryLink(
                                  date: lesson.date,
                                  lessonId: lesson.id,
                                )),
                          ),
                        )
                      ],
                    ),
                    if (allAttendees > 0)
                      Padding(
                        padding: const EdgeInsets.only(top: 14),
                        child: AttendeesPreview(
                          lesson: lesson,
                          maxAttendeesToDisplay: 5,
                        ),
                      ),
                    if (allAttendees == 0)
                      Text(
                        emptyClass.i18n,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    Row(
                      children: [
                        Expanded(
                          child: LinearProgressIndicator(
                            value: _getFullPercentage(
                                allAttendees, lesson.classCapacity),
                            valueColor: AlwaysStoppedAnimation<Color>(
                                Theme.of(context).primaryColor),
                            backgroundColor:
                                Theme.of(context).primaryColor.withAlpha(70),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 8, left: 10),
                          child: Text(
                            "$allAttendees/${lesson.classCapacity}",
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )));
  }

  String _formattedLessonInformation({
    String timeStart,
    String timeEnd,
  }) {
    if (timeEnd.isEmpty) {
      return startingAt.i18n.fill([timeStart]);
    } else {
      return "${timeStart} - ${timeEnd}";
    }
  }

  String _capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  double _getFullPercentage(int numberOfAttendees, int classCapacity) =>
      (numberOfAttendees * 100 / classCapacity) / 100;
}
