import 'package:checkin/src/models/gym.dart';
import 'package:checkin/src/models/payment_method.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'payment_methods_event.freezed.dart';

@freezed
abstract class PaymentMethodsEvent with _$PaymentMethodsEvent {
  //TODO: this can be an array of payment methods as soon as we support more then one payment method
  const factory PaymentMethodsEvent.paymentMethodUpdated(
      {@required String userEmail,
      PaymentMethod paymentMethod}) = PaymentMethodUpdated;

  const factory PaymentMethodsEvent.registerBankAccount(
      {@required Gym gym, @required String billingEmail}) = RegisterBankAccount;

  const factory PaymentMethodsEvent.changeBankAccount(
      {@required Gym gym,
      @required String billingEmail}) = ChangeBankAccount;
}
