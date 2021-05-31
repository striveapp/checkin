import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/api/membership_api.dart';
import 'package:checkin/src/logging/logger.dart';
import 'package:checkin/src/models/gym.dart';
import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:checkin/src/repositories/gym_repository.dart';
import 'package:flutter/material.dart';

import './bloc.dart';

class SubscriptionBloc extends Bloc<SubscriptionEvent, SubscriptionState> {
  final GymRepository gymRepository;
  final MembershipApi membershipApi;
  final AnalyticsRepository analyticsRepository;
  Gym gym;

  SubscriptionBloc({
    @required this.gymRepository,
    @required this.membershipApi,
    @required this.analyticsRepository,
  }) : super(SubscriptionInitial()) {
    try {
      gymRepository.getGym().listen(_onGymUpdated);
    } catch (err, st) {
      Logger.log.e("Error while fetching the plans stream!", err, st);
    }
  }

  void _onGymUpdated(Gym gym) {
    if (gym != null) {
      this.gym = gym;
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
