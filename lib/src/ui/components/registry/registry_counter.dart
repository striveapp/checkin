import 'package:checkin/src/blocs/registry/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistryCounter extends StatelessWidget {
  static const String full = 'full';
  static const String attendees = 'Attendees';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistryBloc, RegistryState>(
      builder: (BuildContext context, RegistryState state) {
        if (state is RegistryUninitialized || state is RegistryLoading) {
          return _getCounterWidget(0, 1, context);
        }

        if (state is RegistryLoaded) {
          Lesson currentLesson = state.currentLesson;
          List<Attendee> allAttendees = [...currentLesson.attendees, ...currentLesson.acceptedAttendees];

          return _getCounterWidget(allAttendees.length, currentLesson.classCapacity, context);
        }
        return ErrorWidget('Unknown State [$state] received in: registry_page');
      },
    );
  }

  Row _getCounterWidget(int counter, int classCapacity, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          "${attendees.i18n} ($counter)",
          style: Theme.of(context).textTheme.headline2,
        ),
        Text("${_getFullPercentage(counter, classCapacity)} ${full.i18n}",
            style:
            Theme.of(context).textTheme.headline5.apply(fontWeightDelta: 3))
      ],
    );
  }

  String _getFullPercentage(int numberOfAttendees, int classCapacity) =>
      (numberOfAttendees * 100 / classCapacity).toStringAsFixed(0) + "%";
}
