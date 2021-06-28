// @dart=2.9

import 'package:package_info/package_info.dart';
import 'package:pub_semver/pub_semver.dart';

import 'debug_util.dart';

class VersionUtil {
  Future<Version> getCurrentVersion() async {
    if (isInDebugMode) {
      return Version(1, 0, 0);
    }
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    Version currentVersion = Version.parse(packageInfo.version);
    return currentVersion;
  }
}
