import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'membership.freezed.dart';

@freezed
abstract class Membership with _$Membership {
  const factory Membership.cardMembership(
      {@required final String status,
      @required final int currentPeriodEnd,
      @required final String email,
      @required String lastFourDigits,
      @required String country}) = CardMembership;

  const factory Membership.sepaMembership(
      {@required final String status,
      @required final int currentPeriodEnd,
      @required final String email,
      @required String lastFourDigits,
      @required String country}) = SepaMembership;
}
