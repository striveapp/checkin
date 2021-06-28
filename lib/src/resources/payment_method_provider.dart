// @dart=2.9

import 'package:checkin/src/models/payment_method.dart';
import 'package:checkin/src/repositories/payment_method_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentMethodProvider implements PaymentMethodRepository {
  static const String gymPath = "gyms";
  static const String path = 'customers';

  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Stream<PaymentMethod> getPaymentMethod({String gymId, String email}) {
    return _firestore
        .collection(gymPath)
        .doc(gymId)
        .collection(path)
        .doc(email)
        .snapshots()
        .map((doc) => toPaymentMethod(email, doc));
  }

  toPaymentMethod(String email, DocumentSnapshot doc) {
    final data = doc.data();
    if (data == null || data['payment_method'] == null) {
      return null;
    }
    return PaymentMethod(
      billingEmail: email,
      lastFourDigits: data['payment_method']['sepa_debit']['last4'],
      country: data['payment_method']['sepa_debit']['country'],
      customerId: data['infos']['id'],
    );
  }
}
