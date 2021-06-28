// @dart=2.9

import 'package:checkin/src/resources/version_provider.dart';

class VersionRepository {
  final _versionProvider = VersionProvider();

  Stream<String> getMinimumVersionRequired() => _versionProvider.getMinimumVersionRequired();
}
