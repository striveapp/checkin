import 'package:checkin/src/blocs/lesson/bloc.dart';
import 'package:checkin/src/blocs/lesson/registry/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/ui/components/registry/registry_controls.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'attendees_counter.dart';
import 'attendees_list.dart';

class Registry extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RegistryBloc>(
      create: (BuildContext context) => RegistryBloc(
        lessonBloc: BlocProvider.of<LessonBloc>(context),
        userBloc: BlocProvider.of<UserBloc>(context),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: AttendeesCounter(),
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
