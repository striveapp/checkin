import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/api/membership_api.dart';
import 'package:checkin/src/blocs/gym/bloc.dart';
import 'package:checkin/src/logging/logger.dart';
import 'package:checkin/src/models/gym.dart';
import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:flutter/material.dart';

import './bloc.dart';

class SubscriptionBloc extends Bloc<SubscriptionEvent, SubscriptionState> {
  final GymBloc gymBloc;
  final MembershipApi membershipApi;
  final AnalyticsRepository analyticsRepository;
  Gym gym;

  SubscriptionBloc({
    @required this.gymBloc,
    @required this.membershipApi,
    @required this.analyticsRepository,
  })  : assert(membershipApi != null && analyticsRepository != null && gymBloc != null),
        super(SubscriptionInitial()) {
    try {
      _onGymStateUpdated(gymBloc.state);
      gymBloc.listen(_onGymStateUpdated);
    } catch (err, st) {
      Logger.log.e("Error while fetching the plans stream!", err, st);
    }
  }

  void _onGymStateUpdated(GymState gymState) {
    if (gymState is GymLoaded) {
      gym = gymState.gym;
    }
  }

  @override
  Stream<SubscriptionState> mapEventToState(
    SubscriptionEvent event,
  ) async* {
    if (event is Subscribe) {
      if (event.customerId == "null") {
        yield SubscriptionLoading();
        await analyticsRepository.logSubscriptionWithEmptyCustomer(
            gymId: gym.id, priceId: event.priceId);
        yield SubscriptionError(errorMessage: "You must first activate your bank account");
      } else {
        try {
          yield SubscriptionLoading();
          await membershipApi.createSubscription(
              gymId: gym.id, priceId: event.priceId, customerId: event.customerId);
          yield SubscriptionSuccess();
        } catch (err, stackTrace) {
          await analyticsRepository.subscriptionError(err: err, stackTrace: stackTrace);
          yield SubscriptionError(errorMessage: "Something went wrong with subscription: [$err]");
        }
      }
    }
  }
}
