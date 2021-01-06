import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'gym.freezed.dart';
part 'gym.g.dart';

@freezed
abstract class Gym with _$Gym {
  factory Gym({
    @required final String id,
    @required final String name,
    @required final String paymentAppDomain,
    @required final String stripePublicKey,
    @Default(false) final bool hasActivePayments,
  }) = _Gym;

  factory Gym.fromJson(Map<String, dynamic> json) => _$GymFromJson(json);
}
