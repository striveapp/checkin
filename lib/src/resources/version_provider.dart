import 'package:cloud_firestore/cloud_firestore.dart';

class VersionProvider {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static const String path = 'config/version';

  Stream<String> getMinimumVersionRequired() {
    return _firestore
        .doc(path)
        .snapshots()
        .map((versionDocument) => versionDocument.data()["minimumVersionRequired"]);
  }
}
