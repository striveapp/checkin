// @dart=2.9

import 'dart:async';

import 'package:checkin/src/models/payment_method.dart';

abstract class PaymentMethodRepository {
  Stream<PaymentMethod> getPaymentMethod({String gymId, String email});
}
