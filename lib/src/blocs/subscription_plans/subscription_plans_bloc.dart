import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/gym/bloc.dart';
import 'package:checkin/src/blocs/subscription_plans/subscription_plans_event.dart';
import 'package:checkin/src/blocs/subscription_plans/subscription_plans_state.dart';
import 'package:checkin/src/models/gym.dart';
import 'package:checkin/src/models/subscription_plan.dart';
import 'package:checkin/src/repositories/subscription_plans_repository.dart';
import 'package:flutter/foundation.dart';

class SubscriptionPlansBloc
    extends Bloc<SubscriptionPlansEvent, SubscriptionPlansState> {
  final SubscriptionPlansRepository subscriptionPlansRepository;
  final GymBloc gymBloc;

  StreamSubscription<List<SubscriptionPlan>> streamSubscription;

  SubscriptionPlansBloc({
    @required this.subscriptionPlansRepository,
    @required this.gymBloc,
  }) : assert(subscriptionPlansRepository != null && gymBloc != null) {
    streamSubscription?.cancel();
    try {
      gymBloc.listen((GymState gymState) {
        if (gymState is GymLoaded) {
          Gym gym = gymState.gym;
          streamSubscription =
              subscriptionPlansRepository.getPlans().listen((plans) {
            add(SubscriptionPlansUpdated(
              basePaymentUrl:
                  "https://${gym.domain}/payment.html?pk=${gym.stripePublicKey}&host=${gym.host}",
              subscriptionPlans: _sortByPrice(plans),
            ));
          });
        }
      });
    } catch (err) {
      debugPrint("Error while fetching the plans stream $err");
    }
  }

  @override
  SubscriptionPlansState get initialState => SubscriptionPlansInitial();

  @override
  Stream<SubscriptionPlansState> mapEventToState(
      SubscriptionPlansEvent event) async* {
    if (event is SubscriptionPlansUpdated) {
      if (event.subscriptionPlans == null || event.subscriptionPlans.isEmpty) {
        yield SubscriptionPlansEmpty();
      } else {
        yield SubscriptionPlansLoaded(
            basePaymentUrl: event.basePaymentUrl, subscriptionPlans: event.subscriptionPlans);
      }
    }
  }

  List<SubscriptionPlan> _sortByPrice(List<SubscriptionPlan> plans) {
    List<SubscriptionPlan> sortedPlans = plans;
    sortedPlans.sort((planA, planB) => planA.price.compareTo(planB.price) * -1);
    return sortedPlans;
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
