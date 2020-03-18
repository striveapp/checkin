import 'package:checkin/src/blocs/registry/bloc.dart';
import 'package:checkin/src/config.dart' as config;
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttendeesCounter extends StatelessWidget {
  static const String full = 'full';
  static const String attendees = 'Attendees';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistryBloc, RegistryState>(
      builder: (BuildContext context, RegistryState state) {
        if (state is RegistryUninitialized || state is RegistryLoading) {
          return LoadingIndicator();
        }

        if (state is RegistryLoaded) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "${attendees.i18n} (${state.currentLesson.attendees.length})",
                style: Theme.of(context).textTheme.headline2,
              ),
              Text("${_getFullPercentage(state.currentLesson.attendees.length)} ${full.i18n}",
                  style:
                  Theme.of(context).textTheme.headline5.apply(fontWeightDelta: 3))
            ],
          );
        }
        return ErrorWidget('Unknown State [$state] received in: registry_page');
      },
    );
  }

  //TODO this should be configurable
  String _getFullPercentage(int numberOfAttendees) =>
      (numberOfAttendees * 100 / config.CLASS_CAPACITY).toStringAsFixed(0) + "%";
}
