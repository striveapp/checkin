// @dart=2.9

import 'package:checkin/src/blocs/lessons_stats/bloc.dart';
import 'package:checkin/src/ui/components/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'attendee_info_card.dart';

class AttendeesInfoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonsStatsBloc, LessonsStatsState>(
      builder: (BuildContext context, LessonsStatsState state) {
        return state.map(
          lessonsStatsInitial: ((LessonsStatsInitial state) => EmptyWidget()),
          lessonsStatsUpdated: ((LessonsStatsUpdated state) => ListView.builder(
              itemCount: state.attendeesWithCounter.length,
              itemBuilder: (BuildContext context, int index) => InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamed('profile/${state.attendeesWithCounter[index].email}');
                    },
                    child: AttendeeInfoCard(
                      attendeeEmail: state.attendeesWithCounter[index].email,
                      attendedLessons: state.attendeesWithCounter[index].counter,
                    ),
                  ))),
        );
      },
    );
  }
}
