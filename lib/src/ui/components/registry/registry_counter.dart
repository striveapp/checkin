import 'package:checkin/src/blocs/lesson/registry/bloc.dart';
import 'package:checkin/src/config.dart' as config;
import 'package:checkin/src/localization/localization.dart';
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
          return _getCounterWidget(0, context);
        }

        if (state is RegistryLoaded) {
          var allAttendees = [...state.attendees, ...state.acceptedAttendees];

          return _getCounterWidget(allAttendees.length, context);
        }
        return ErrorWidget('Unknown State [$state] received in: registry_page');
      },
    );
  }

  Row _getCounterWidget(int counter, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          "${attendees.i18n} ($counter)",
          style: Theme.of(context).textTheme.headline2,
        ),
        Text("${_getFullPercentage(counter)} ${full.i18n}",
            style:
            Theme.of(context).textTheme.headline5.apply(fontWeightDelta: 3))
      ],
    );
  }

  //TODO this should be configurable
  String _getFullPercentage(int numberOfAttendees) =>
      (numberOfAttendees * 100 / config.CLASS_CAPACITY).toStringAsFixed(0) + "%";
}
