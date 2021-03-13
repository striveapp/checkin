import 'package:checkin/src/blocs/registry/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/master.dart';
import 'package:checkin/src/resources/lesson_instances_provider.dart';
import 'package:checkin/src/ui/components/registry/edit_lesson/edit_lesson_capacity.dart';
import 'package:checkin/src/ui/components/registry/edit_lesson/edit_lesson_name.dart';
import 'package:checkin/src/ui/components/registry/edit_lesson/edit_lesson_time.dart';
import 'package:checkin/src/util/debug_util.dart';
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
    return Column(
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
          padding: const EdgeInsets.only(left: 40.0, right: 40, top: 10, bottom: 30),
          child: Column(
            children: [
              EditLessonTime(
                  text: start.i18n,
                  time: lesson.timeStart,
                  onTimePicked: (timePicked) {
                    context
                        .read<RegistryBloc>()
                        .add(RegistryEvent.updateTimeStart(gymId: gymId, newTimeStart: timePicked));
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
              if (isInDebugMode)
                ElevatedButton(
                    onPressed: () {
                      LessonInstancesProvider().updateLessonMasters(gymId, lesson.date, lesson.id, [
                        Master(
                          name: "stoc",
                          imageUrl:
                              "https://cdn.shopify.com/s/files/1/0476/1541/0334/products/coeurderoserouge_720x.jpg?v=1603622253",
                          email: "stoc@zzo.com",
                        )
                      ]);
                    },
                    child: Text("update masters"))
            ],
          ),
        ),
      ],
    );
  }
}
