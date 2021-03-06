import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/logging/logger.dart';
import 'package:checkin/src/models/gym.dart';
import 'package:checkin/src/models/subscription_plan.dart';
import 'package:checkin/src/repositories/gym_repository.dart';
import 'package:checkin/src/repositories/subscription_plans_repository.dart';
import 'package:flutter/foundation.dart';

import 'bloc.dart';

class SubscriptionPlansBloc extends Bloc<SubscriptionPlansEvent, SubscriptionPlansState> {
  final SubscriptionPlansRepository subscriptionPlansRepository;
  final GymRepository gymRepository;
  final String planId;

  StreamSubscription<List<SubscriptionPlan>> streamSubscription;

  SubscriptionPlansBloc({
    @required this.subscriptionPlansRepository,
    @required this.gymRepository,
    this.planId,
  }) : super(SubscriptionPlansInitial()) {
    streamSubscription?.cancel();
    try {
      gymRepository.getGym().listen(_onGymChanged);
    } catch (err, st) {
      Logger.log.e("Error while fetching the plans stream", err, st);
    }
  }

  void _onGymChanged(Gym gym) {
    if (planId == null) {
      streamSubscription = subscriptionPlansRepository.getPlans(gymId: gym.id).listen((plans) {
        add(SubscriptionPlansUpdated(
          subscriptionPlans: _sortByPrice(plans),
        ));
      });
    } else {
      streamSubscription =
          subscriptionPlansRepository.getSubPlans(gymId: gym.id, planId: planId).listen((plans) {
        add(SubscriptionPlansUpdated(
          subscriptionPlans: _sortByPrice(plans),
        ));
      });
    }
  }

  @override
  Stream<SubscriptionPlansState> mapEventToState(SubscriptionPlansEvent event) async* {
    if (event is SubscriptionPlansUpdated) {
      if (event.subscriptionPlans.isEmpty) {
        yield SubscriptionPlansEmpty();
      } else {
        yield SubscriptionPlansLoaded(
          subscriptionPlans: event.subscriptionPlans,
        );
      }
    }
  }

  List<SubscriptionPlan> _sortByPrice(List<SubscriptionPlan> plans) {
    List<SubscriptionPlan> sortedPlans = plans;
    sortedPlans.sort((planA, planB) => comparePlans(planA, planB));
    return sortedPlans;
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }

  int comparePlans(SubscriptionPlan planA, SubscriptionPlan planB) {
    if (planA is SimpleSubscription && planB is SimpleSubscription) {
      return planA.price.compareTo(planB.price);
    }

    if (planA is SubscriptionWithPrices && planB is SubscriptionWithPrices) {
      return planA.startingPrice.compareTo(planB.startingPrice);
    }

    // todo mixed cases not yet handled
    return 0;
  }
}
