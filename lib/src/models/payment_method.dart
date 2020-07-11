import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_method.freezed.dart';

@freezed
abstract class PaymentMethod with _$PaymentMethod {
  factory  PaymentMethod({
    @required final String customerId,
    @required final String billingEmail,
    @required final String lastFourDigits,
    @required final String country,
  }) =  _PaymentMethod;
}
