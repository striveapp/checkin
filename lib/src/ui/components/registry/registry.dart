import 'package:checkin/src/api/lesson_api.dart';
import 'package:checkin/src/blocs/lesson/registry/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:checkin/src/ui/components/registry/registry_controls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'attendees_list.dart';
import 'registry_counter.dart';

class Registry extends StatelessWidget {
  final Lesson lesson;

  Registry({@required this.lesson});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegistryBloc>(
      create: (BuildContext context) => RegistryBloc(
        lesson: lesson,
        lessonApi: RepositoryProvider.of<LessonApi>(context),
        lessonRepository: RepositoryProvider.of<LessonRepository>(context),
        userBloc: BlocProvider.of<UserBloc>(context),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: RegistryCounter(),
          ),
          SizedBox(
            height: 10,
          ),
          AttendeesList(),
          SizedBox(
            height: 20,
          ),
          RegistryControls()
        ],
      ),
    );
  }
}
