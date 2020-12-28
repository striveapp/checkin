import 'package:open_mail_app/open_mail_app.dart';
import 'package:platform/platform.dart';
import 'package:url_launcher/url_launcher.dart';

class IntentLauncherUtil {
  Future<void> launchEmailApp({String chooserTitle}) async {
    if (LocalPlatform().isAndroid) {
      await OpenMailApp.openMailApp(nativePickerTitle: chooserTitle);
    } else if (LocalPlatform().isIOS) {
      await launch("message://");
    }
  }
}
