import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'subscription_event.freezed.dart';

@freezed
abstract class SubscriptionEvent with _$SubscriptionEvent {

  const factory SubscriptionEvent.subscribe({
    @required String gymId,
    @required String priceId,
    @required String customerId,
  }) = Subscribe;
}
