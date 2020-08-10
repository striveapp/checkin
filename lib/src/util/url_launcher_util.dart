import 'package:url_launcher/url_launcher.dart';

class UrlLauncherUtil {
  Future<bool> launchUrl(String url) async {
    final uri = Uri.encodeFull(url);
    if (await canLaunch(uri)) {
      return await launch(uri);
    } else {
      throw 'Could not launch $uri';
    }
  }
}
