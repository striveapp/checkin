import 'package:url_launcher/url_launcher.dart';

class UrlLauncherUtil {
  Future<bool> launchUrl(String url) async {
    if (await canLaunch(url)) {
      return await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
