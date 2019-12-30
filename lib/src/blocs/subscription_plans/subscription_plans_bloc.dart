import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/blocs/subscription_plans/subscription_plans_event.dart';
import 'package:checkin/src/blocs/subscription_plans/subscription_plans_state.dart';
import 'package:checkin/src/models/subscription_plan.dart';
import 'package:checkin/src/resources/subscription_plans_repository.dart';
import 'package:flutter/cupertino.dart';

class SubscriptionPlansBloc
    extends Bloc<SubscriptionPlansEvent, SubscriptionPlansState> {
  final SubscriptionPlansRepository subscriptionPlansRepository;
  StreamSubscription<List<SubscriptionPlan>> streamSubscription;

  SubscriptionPlansBloc({@required this.subscriptionPlansRepository}) : assert(subscriptionPlansRepository != null) {
    streamSubscription?.cancel();
    try {
      streamSubscription = subscriptionPlansRepository.getPlans().listen((plans) {
        add(SubscriptionPlansUpdated(subscriptionPlans: _sortByPrice(plans)));
      });
    } catch(err) {
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
            subscriptionPlans: event.subscriptionPlans);
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
