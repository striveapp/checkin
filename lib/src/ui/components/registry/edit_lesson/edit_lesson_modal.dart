// @dart=2.9

import 'package:checkin/src/blocs/edit_lesson/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/ui/components/registry/edit_lesson/edit_lesson_capacity.dart';
import 'package:checkin/src/ui/components/registry/edit_lesson/edit_lesson_name.dart';
import 'package:checkin/src/ui/components/registry/edit_lesson/edit_lesson_time.dart';
import 'package:checkin/src/ui/components/registry/edit_lesson/masters_selection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditLessonModal extends StatelessWidget {
  static const String start = "Start";
  static const String end = "End";

  final String gymId;
  final Lesson lesson;

  const EditLessonModal({@required String this.gymId, @required Lesson this.lesson});

  @override
  Widget build(BuildContext context) {
    return AnimatedPadding(
      padding: MediaQuery.of(context).viewInsets,
      duration: const Duration(milliseconds: 100),
      curve: Curves.decelerate,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Icon(
                Icons.maximize_rounded,
                size: 50,
                color: Colors.grey,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40.0, right: 40, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  EditLessonTime(
                      text: start.i18n,
                      time: lesson.timeStart,
                      onTimePicked: (timePicked) {
                        context
                            .read<EditLessonBloc>()
                            .add(EditLessonEvent.updateTimeStart(newTimeStart: timePicked));
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  EditLessonTime(
                      text: end.i18n,
                      time: lesson.timeEnd,
                      onTimePicked: (timePicked) {
                        context
                            .read<EditLessonBloc>()
                            .add(EditLessonEvent.updateTimeEnd(newTimeEnd: timePicked));
                      }),
                  SizedBox(
                    height: 20,
                  ),
                  EditLessonName(
                    gymId: gymId,
                    lessonName: lesson.name,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  EditLessonCapacity(
                    gymId: gymId,
                    classCapacity: lesson.classCapacity,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  MastersSelection(masters: lesson.masters),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
