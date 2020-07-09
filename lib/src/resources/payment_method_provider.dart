import 'package:checkin/src/models/payment_method.dart';
import 'package:checkin/src/repositories/payment_method_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PaymentMethodProvider implements PaymentMethodRepository {
  Firestore _firestore = Firestore.instance;
  static const String gymPath = "gyms";
  static const String path = 'customers';

  @override
  Stream<PaymentMethod> getPaymentMethod({String gymId, String email}) {
    return _firestore
        .collection(gymPath)
        .document(gymId)
        .collection(path)
        .document(email)
        .snapshots()
        .map((doc) => toPaymentMethod(email, doc.data));
  }

  toPaymentMethod(String email, dynamic data) {
    if (data == null || data['payment_method'] == null) {
      return null;
    }
    return PaymentMethod(
      billingEmail: email,
      lastFourDigits: data['payment_method']['last4'],
      country: data['payment_method']['country'],
    );
  }
}
