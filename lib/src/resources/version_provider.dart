import 'package:cloud_firestore/cloud_firestore.dart';

class VersionProvider {
  Firestore _firestore = Firestore.instance;
  static const String path = 'config/version';

  Stream<String> getMinimumVersionRequired() {
    return _firestore.document(path)
        .snapshots()
        .map((versionDocument) => versionDocument.data["minimumVersionRequired"]);
  }
}