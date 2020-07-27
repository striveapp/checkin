import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/gym/bloc.dart';
import 'package:checkin/src/models/gym.dart';
import 'package:checkin/src/models/subscription_plan.dart';
import 'package:checkin/src/repositories/subscription_plans_repository.dart';
import 'package:flutter/foundation.dart';

import 'bloc.dart';

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
              subscriptionPlansRepository.getPlans(gymId: gym.id).listen((plans) {
            add(SubscriptionPlansUpdated(
              basePaymentUrl:
                  "https://${gym.domain}/payment.html?pk=${gym.stripePublicKey}&host=${gym.host}",
              subscriptionPlans: _sortByPrice(plans),
              gym: gym,
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
      if (event.subscriptionPlans.isEmpty) {
        yield SubscriptionPlansEmpty();
      } else {
        yield SubscriptionPlansLoaded(
          basePaymentUrl: event.basePaymentUrl,
          subscriptionPlans: event.subscriptionPlans,
          gymId: event.gym.id,
        );
      }
    }
  }

  List<SubscriptionPlan> _sortByPrice(List<SubscriptionPlan> plans) {
    List<SubscriptionPlan> sortedPlans = plans;
    // todo planWithPrices: fix sort
//    sortedPlans.sort((planA, planB) => planA.price.compareTo(planB.price) * -1);
    return sortedPlans;
  }

  @override
  Future<void> close() {
    streamSubscription?.cancel();
    return super.close();
  }
}
