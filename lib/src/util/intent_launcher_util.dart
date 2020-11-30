import 'package:android_intent/android_intent.dart';
import 'package:platform/platform.dart';
import 'package:url_launcher/url_launcher.dart';

class IntentLauncherUtil {
  Future<void> launchEmailApp() async {
    if (LocalPlatform().isAndroid) {
      AndroidIntent intent = AndroidIntent(
        action: 'android.intent.action.MAIN',
        category: 'android.intent.category.APP_EMAIL',
      );
      await intent.launch();
    } else if (LocalPlatform().isIOS) {
      await launch("message://");
    }
  }
}
