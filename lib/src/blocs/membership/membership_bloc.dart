import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/api/membership_api.dart';
import 'package:checkin/src/blocs/membership/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/membership.dart';
import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:checkin/src/repositories/membership_repository.dart';
import 'package:flutter/material.dart';

class MembershipBloc extends Bloc<MembershipEvent, MembershipState> {
  final MembershipRepository _membershipRepository;
  final MembershipApi _membershipApi;
  final UserBloc _userBloc;
  final AnalyticsRepository _analyticsRepository;

  String _gymId;
  StreamSubscription<Membership> _membershipSub;

  MembershipBloc(
      {@required MembershipRepository membershipRepository,
      @required MembershipApi membershipApi,
      @required UserBloc userBloc,
      @required AnalyticsRepository analyticsRepository})
      : assert(membershipRepository != null &&
            membershipApi != null &&
            userBloc != null &&
            analyticsRepository != null),
        _membershipRepository = membershipRepository,
        _membershipApi = membershipApi,
        _analyticsRepository = analyticsRepository,
        _userBloc = userBloc {
    _userBloc.listen((userState) {
      if (userState is UserSuccess) {
        _gymId = userState.currentUser.selectedGymId;
        _membershipSub?.cancel();

        _membershipSub = _membershipRepository
            .getMembership(
          gymId: userState.currentUser.selectedGymId,
          email: userState.currentUser.email,
        )
            .listen((membership) {
          add(MembershipUpdated(
            customerEmail: userState.currentUser.email,
            membership: membership,
          ));
        });
        _membershipSub.onError((error) {
          debugPrint("An error occurred while loading membership $error");
        });
      }
    });
  }

  @override
  MembershipState get initialState => InitialMembershipState();

  @override
  Stream<MembershipState> mapEventToState(MembershipEvent event) async* {

    if (event is Unsubscribe) {
      yield MembershipState.membershipLoading();
      try {
        await _membershipApi.unsubscribe(gymId: _gymId);
      } catch (err, stackTrace) {
        _analyticsRepository.unsubscribeError(err: err, stackTrace: stackTrace);
        yield MembershipState.membershipError(
            errorMessage: "Something went wrong while with unsubscribe: [$err]");
      }
    }

    if (event is MembershipUpdated) {
      if (event.membership.status == "active") {
        yield MembershipState.membershipActive(membership: event.membership);
      } else {
        yield MembershipState.membershipInactive(
          customerEmail: event.customerEmail,
          customerId: event.membership.customerId,
        );
      }
    }
  }

  @override
  Future<void> close() {
    _membershipSub?.cancel();
    return super.close();
  }
}
