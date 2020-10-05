import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/sessions/sessions_event.dart';
import 'package:checkin/src/blocs/sessions/sessions_state.dart';
import 'package:checkin/src/constants.dart' as constants;
import 'package:checkin/src/models/membership.dart';
import 'package:checkin/src/repositories/membership_repository.dart';
import 'package:checkin/src/repositories/stats_repository.dart';
import 'package:flutter/foundation.dart';

import './bloc.dart';

class SessionsBloc extends Bloc<SessionsEvent, SessionsState> {
  final MembershipRepository membershipRepository;
  final StatsRepository statsRepository;
  final String selectedGymId;
  final String userEmail;

  SessionsBloc({
    @required this.membershipRepository,
    @required this.statsRepository,
    @required this.selectedGymId,
    @required this.userEmail,
  }) {
    this.membershipRepository.getMembership(gymId: selectedGymId, email: userEmail,).listen((membership) {
      if( membership.totalLessonsOfPlan == null ) {
        add(SessionsUpdated(membership: membership));
      } else {
        this.statsRepository.getUserStats(selectedGymId, userEmail, constants.MONTH).listen((userHistory) {
          add(SessionsUpdated(membership: membership, userHistory: userHistory));
        });
      }
    });

  }

  @override
  SessionsState get initialState => InitialSessionsState();

  @override
  Stream<SessionsState> mapEventToState(SessionsEvent event,) async* {
    // TODO: Add Logic
    if( event is SessionsUpdated) {
      if( event.membership.totalLessonsOfPlan == null) {
        yield SessionsState.sessionsUnlimited();
      }

      if( event.membership.status == Membership.ACTIVE_MEMBERSHIP) {
        var attendedLessons = event.userHistory.attendedLessons.length.toDouble();
        var totalLessonsOfPlan = event.membership.totalLessonsOfPlan;
        if( attendedLessons >= totalLessonsOfPlan) {
          yield SessionsState.sessionsWarning(totalLessonsOfPlan: totalLessonsOfPlan, attendedLessons: attendedLessons);
        } else {
          yield SessionsState.sessionsLoaded(totalLessonsOfPlan: totalLessonsOfPlan, attendedLessons: attendedLessons);
        }
      }
    }
  }
}
