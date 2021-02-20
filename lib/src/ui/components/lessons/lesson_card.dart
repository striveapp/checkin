import 'package:checkin/src/blocs/dynamic_link/bloc.dart';
import 'package:checkin/src/constants.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/ui/components/lessons/attendees_preview.dart';
import 'package:checkin/src/ui/components/lessons/lesson_type_badge.dart';
import 'package:checkin/src/ui/components/rounded_image.dart';
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
        constraints: BoxConstraints(minHeight: 180),
        padding: EdgeInsets.only(top: 15.0),
        foregroundDecoration: lesson.isClosed
            ? BoxDecoration(color: Colors.grey, backgroundBlendMode: BlendMode.saturation)
            : null,
        child: Card(
            key: Key(lesson.name),
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed("registry/${lesson.date}/${lesson.id}");
              },
              child: Padding(
                padding: EdgeInsets.only(
                  right: 20,
                  left: 20,
                  top: 16,
                  bottom: 24,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Column(
                          children: [
                            RoundedImage(
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
                              LessonName(
                                name: lesson.name,
                                isDisabled: lesson.isClosed,
                              ),
                              LessonTime(
                                timeStart: lesson.timeStart,
                                timeEnd: lesson.timeEnd,
                                isDisabled: lesson.isClosed,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          flex: 1,
                          child: ShareButton(
                            lessonId: lesson.id,
                            lessonDate: lesson.date,
                            isDisabled: lesson.isClosed,
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
                        style: Theme.of(context)
                            .textTheme
                            .headline5
                            .apply(color: lesson.isClosed ? Theme.of(context).disabledColor : null),
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
                            style: Theme.of(context).textTheme.headline5.apply(
                                color: lesson.isClosed ? Theme.of(context).disabledColor : null),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )));
  }

  double _getFullPercentage(int numberOfAttendees, int classCapacity) =>
      (numberOfAttendees * 100 / classCapacity) / 100;
}

class LessonName extends StatelessWidget {
  final String name;
  final bool isDisabled;

  const LessonName({
    Key key,
    this.name,
    this.isDisabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      _capitalize(name),
      overflow: TextOverflow.fade,
      softWrap: false,
      style: Theme.of(context)
          .textTheme
          .headline1
          .apply(color: isDisabled ? Theme.of(context).disabledColor : null),
    );
  }

  String _capitalize(String s) => s[0].toUpperCase() + s.substring(1);
}

class LessonTime extends StatelessWidget {
  static const String startingAt = 'Starting at %s';

  final String timeStart;
  final String timeEnd;
  final bool isDisabled;

  const LessonTime({
    Key key,
    this.timeStart,
    this.timeEnd,
    this.isDisabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      _formattedLessonInformation(
        timeStart: timeStart,
        timeEnd: timeEnd,
      ),
      style: Theme.of(context)
          .textTheme
          .headline3
          .apply(color: isDisabled ? Theme.of(context).disabledColor : null),
    );
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
}

class ShareButton extends StatelessWidget {
  final String lessonId;
  final String lessonDate;
  final bool isDisabled;

  const ShareButton({
    Key key,
    this.lessonId,
    this.lessonDate,
    this.isDisabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.share,
        color: isDisabled ? Theme.of(context).disabledColor : null,
      ),
      onPressed: !isDisabled
          ? () => context.read<DynamicLinkBloc>().add(ShareRegistryLink(
                lessonId: lessonId,
                date: lessonDate,
              ))
          : DISABLED_BUTTON,
    );
  }
}
