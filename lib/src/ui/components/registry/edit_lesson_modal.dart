import 'package:checkin/src/blocs/registry/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/ui/components/registry/edit_lesson_time.dart';
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
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      child: Column(
        children: [
          Icon(
            Icons.remove_rounded,
            size: 50,
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 10),
            child: Column(
              children: [
                EditLessonTime(
                    text: start.i18n,
                    time: lesson.timeStart,
                    onTimePicked: (timePicked) {
                      context.read<RegistryBloc>().add(
                          RegistryEvent.updateTimeStart(gymId: gymId, newTimeStart: timePicked));
                    }),
                SizedBox(
                  height: 20,
                ),
                EditLessonTime(
                    text: end.i18n,
                    time: lesson.timeEnd,
                    onTimePicked: (timePicked) {
                      context
                          .read<RegistryBloc>()
                          .add(RegistryEvent.updateTimeEnd(gymId: gymId, newTimeEnd: timePicked));
                    }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
