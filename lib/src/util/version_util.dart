import 'package:package_info/package_info.dart';
import 'package:pub_semver/pub_semver.dart';

class VersionUtil {
  Future<Version> getCurrentVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    Version currentVersion = Version.parse(packageInfo.version);
    return currentVersion;
  }
}
