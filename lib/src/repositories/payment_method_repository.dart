import 'dart:async';

import 'package:checkin/src/models/payment_method.dart';

abstract class PaymentMethodRepository {
  Stream<PaymentMethod> getPaymentMethod({required String gymId, required String email});
}
