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

  StreamSubscription _membershipSub;
  StreamSubscription _statsSub;

  SessionsBloc({
    @required this.membershipRepository,
    @required this.statsRepository,
    @required this.selectedGymId,
    @required this.userEmail,
  }) {
    _membershipSub?.cancel();
    _membershipSub = this.membershipRepository.getMembership(gymId: selectedGymId, email: userEmail,).listen((membership) {
      if( membership.totalLessonsOfPlan == null || membership.status == Membership.INACTIVE_MEMBERSHIP) {
        add(SessionsUpdated(membership: membership));
      } else {
        _statsSub?.cancel();
        _statsSub = this.statsRepository.getUserStats(selectedGymId, userEmail, constants.MONTH).listen((userHistory) {
          add(SessionsUpdatedWithHistory(membership: membership, userHistory: userHistory));
        });
      }
    });
  }

  @override
  SessionsState get initialState => InitialSessionsState();

  @override
  Stream<SessionsState> mapEventToState(SessionsEvent event,) async* {
    if (event is SessionsUpdated) {
      // todo handle cases where membership canceled
      yield SessionsState.sessionsUnlimited();
    }

    if (event is SessionsUpdatedWithHistory) {
      var attendedLessons = event.userHistory.attendedLessons.length.toDouble();
      var totalLessonsOfPlan = event.membership.totalLessonsOfPlan;
      if (attendedLessons >= totalLessonsOfPlan) {
        yield SessionsState.sessionsWarning(
            totalLessonsOfPlan: totalLessonsOfPlan,
            attendedLessons: attendedLessons);
      } else {
        yield SessionsState.sessionsLoaded(
            totalLessonsOfPlan: totalLessonsOfPlan,
            attendedLessons: attendedLessons);
      }
    }


  }

  @override
  Future<void> close() {
    _membershipSub?.cancel();
    _statsSub?.cancel();
    return super.close();
  }
}
