import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/api/membership_api.dart';
import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:flutter/material.dart';

import './bloc.dart';

class SubscriptionBloc extends Bloc<SubscriptionEvent, SubscriptionState> {
  final MembershipApi membershipApi;
  final AnalyticsRepository analyticsRepository;

  SubscriptionBloc({
    @required this.membershipApi,
    @required this.analyticsRepository,
  });

  @override
  SubscriptionState get initialState => SubscriptionInitial();

  @override
  Stream<SubscriptionState> mapEventToState(
    SubscriptionEvent event,
  ) async* {
    if (event is Subscribe) {
      if (event.customerId == "null") {
        yield SubscriptionLoading();
        await analyticsRepository.logSubscriptionWithEmptyCustomer(
            gymId: event.gymId, priceId: event.priceId);
        yield SubscriptionError(
            errorMessage: "You must first activate your bank account");
      } else {
        try {
          yield SubscriptionLoading();
          await membershipApi.createSubscription(
              gymId: event.gymId,
              priceId: event.priceId,
              customerId: event.customerId);
          yield SubscriptionSuccess();
        } catch (err, stackTrace) {
          await analyticsRepository.subscriptionError(
              err: err, stackTrace: stackTrace);
          yield SubscriptionError(
              errorMessage: "Something went wrong with subscription: [$err]");
        }
      }
    }
  }
}
