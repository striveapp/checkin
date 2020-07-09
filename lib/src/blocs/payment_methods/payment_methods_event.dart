import 'package:checkin/src/models/payment_method.dart';
import 'package:meta/meta.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'payment_methods_event.freezed.dart';

@freezed
abstract class PaymentMethodsEvent with _$PaymentMethodsEvent {
  //TODO: this can be an array of payment methods as soon as we support more then one payment method
  const factory PaymentMethodsEvent.paymentMethodUpdated({PaymentMethod paymentMethod}) = PaymentMethodUpdated;
  const factory PaymentMethodsEvent.registerBankAccount() = RegisterBankAccount;
}
