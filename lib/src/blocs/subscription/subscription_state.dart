import 'package:freezed_annotation/freezed_annotation.dart';

part 'subscription_state.freezed.dart';

@freezed
abstract class SubscriptionState with _$SubscriptionState {
  const factory SubscriptionState.subscriptionInitial() = SubscriptionInitial;
  const factory SubscriptionState.subscriptionSuccess() = SubscriptionSuccess;
  const factory SubscriptionState.subscriptionLoading() = SubscriptionLoading;
  const factory SubscriptionState.subscriptionError({String errorMessage}) =
      SubscriptionError;
}
