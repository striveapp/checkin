import 'package:checkin/src/blocs/lessons_stats/bloc.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'attendee_info_card.dart';

class AttendeesInfoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonsStatsBloc, LessonsStatsState>(
      builder: (BuildContext context, LessonsStatsState state) {
        if (state is LessonsStatsInitial) {
          return LoadingIndicator();
        }

        if (state is LessonsStatsUpdated) {
          return Column(
            children: state.acceptedAttendeesWithCounter.entries
                .map((MapEntry mapEntry) => AttendeeInfoCard(
                      attendee: mapEntry.key,
                      attendedLessons: mapEntry.value,
                    ))
                .toList(),
          );
        }

        return ErrorWidget("Unknown state [$state] for attendees_info_list");
      },
    );
  }
}
