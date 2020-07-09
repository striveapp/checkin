import 'package:checkin/src/models/payment_method.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:meta/meta.dart';

part 'payment_methods_state.freezed.dart';

@freezed
abstract class PaymentMethodsState with _$PaymentMethodsState {
  const factory PaymentMethodsState.initialPaymentMethodsState() = InitialPaymentMethodsState;
  const factory PaymentMethodsState.paymentMethodLoaded({PaymentMethod paymentMethod}) =  PaymentMethodLoaded;
  const factory PaymentMethodsState.paymentMethodEmpty() = PaymentMethodEmpty;
}


