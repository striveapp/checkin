import 'package:checkin/src/blocs/dynamic_link/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/ui/components/attendees_preview.dart';
import 'package:checkin/src/ui/components/user_image.dart';
import 'package:checkin/src/util/debug_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonCard extends StatelessWidget {
  static const String emptyClass = 'Nobody in class yet';

  final Lesson lesson;

  LessonCard({
    Key key,
    @required this.lesson,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var allAttendees = lesson.attendees.length + lesson.acceptedAttendees.length;
    return Container(
        height: 180,
        padding: EdgeInsets.only(top: 15.0),
        decoration: isInDebugMode && lesson.lessonConfig != null? BoxDecoration(
          border: Border.all(
            color: toColor(lesson.lessonConfig.color),
            width: 5.0,
          )
        ): null,
        child: Card(
            key: Key(lesson.name),
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("registry/${lesson.date}/${lesson.id}");
              },
              child: Padding(
                padding: EdgeInsets.only(right: 20, left: 20, top: 16, bottom: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        UserImage(
                          userImage: lesson.masters.first.imageUrl,
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
                              Text("${lesson.timeStart} - ${lesson.timeEnd}",
                                  style: Theme.of(context).textTheme.headline3)
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
                            onPressed: () => context.read<DynamicLinkBloc>().add(ShareRegistryLink(
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
                            value: _getFullPercentage(allAttendees, lesson.classCapacity),
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                            backgroundColor: Theme.of(context).primaryColor.withAlpha(70),
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
}

// todo improve this with our colors
Color toColor(String color) {
  switch( color ) {
    case "yellow":
      return Colors.yellow;
    case "red":
      return Colors.red;
    case "purple":
      return Colors.purple;
    default:
      return Colors.yellow;
  }
}

String _capitalize(String s) => s[0].toUpperCase() + s.substring(1);

double _getFullPercentage(int numberOfAttendees, int classCapacity) =>
    (numberOfAttendees * 100 / classCapacity) / 100;
