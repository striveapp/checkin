import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'gym.freezed.dart';

@freezed
abstract class Gym with _$Gym {
  factory  Gym({
    @required final String id,
    @required final String paymentAppDomain,
    @required final String host,
    @required final String stripePublicKey,
    @required final bool hasActivePayments,
  }) = _Gym;
}

