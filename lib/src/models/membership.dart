import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'membership.freezed.dart';

@freezed
abstract class Membership with _$Membership {
  factory Membership({
    @required final String status,
    @required final String name,
    @required final int currentPeriodEnd,
  }) = _Membership;
}
