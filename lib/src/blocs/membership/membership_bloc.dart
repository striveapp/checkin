import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/api/api.dart';
import 'package:checkin/src/api/membership_api.dart';
import 'package:checkin/src/blocs/membership/bloc.dart';
import 'package:checkin/src/models/membership.dart';
import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:checkin/src/repositories/membership_repository.dart';
import 'package:flutter/material.dart';

class MembershipBloc extends Bloc<MembershipEvent, MembershipState> {
  final MembershipRepository _membershipRepository;
  final MembershipApi _membershipApi;
  final AnalyticsRepository _analyticsRepository;
  final String _userEmail;
  final String _selectedGymId;
  
  StreamSubscription<Membership> _membershipSub;

  MembershipBloc(
      {@required MembershipRepository membershipRepository,
      @required MembershipApi membershipApi,
      @required String userEmail,
      @required String selectedGymId,
      @required AnalyticsRepository analyticsRepository})
      : assert(membershipRepository != null &&
            membershipApi != null &&
            userEmail != null &&
            selectedGymId != null &&
            analyticsRepository != null),
        _membershipRepository = membershipRepository,
        _membershipApi = membershipApi,
        _analyticsRepository = analyticsRepository,
        _userEmail = userEmail,
        _selectedGymId = selectedGymId {
    _membershipSub?.cancel();

    _membershipSub = _membershipRepository
        .getMembership(
      gymId: _selectedGymId,
      email: _userEmail,
    )
        .listen((membership) {
      add(MembershipUpdated(
        customerEmail: _userEmail,
        membership: membership,
      ));
    });
    _membershipSub.onError((error) {
      debugPrint("An error occurred while loading membership $error");
    });
  }

  @override
  MembershipState get initialState => InitialMembershipState();

  @override
  Stream<MembershipState> mapEventToState(MembershipEvent event) async* {
    //TODO: this should be handled with a global error message
    if (event is Unsubscribe) {
      yield MembershipState.membershipLoading();
      try {
        await _analyticsRepository.logUnsubscribe();
        await _membershipApi.unsubscribe(gymId: _selectedGymId);
      } on ApiException catch (err) {
        yield MembershipState.membershipError(errorMessage: err.message);
      } catch (err, stackTrace) {
        await _analyticsRepository.unsubscribeError(
            err: err, stackTrace: stackTrace);
        yield MembershipState.membershipError(
            errorMessage:
                "Something went wrong while with unsubscribe: [${err}]");
      }
    }

    if (event is MembershipUpdated) {
      if (event.membership.status == Membership.ACTIVE_MEMBERSHIP) {
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
