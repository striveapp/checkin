import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

import 'debug_util.dart';

class DynamicLinkUtil {
  static const appUniqueIdentifier = 'com.arya.checkin';

  DynamicLinkParameters _getParameters(Uri link) {
    final DynamicLinkParameters parameters = DynamicLinkParameters(
      uriPrefix: isInDebugMode ? 'https://arya.page.link' : 'https://aranha.page.link',  // todo take from gym.host
      link: link,
      androidParameters: AndroidParameters(
        packageName: appUniqueIdentifier,
      ),
      iosParameters: IosParameters(
        bundleId: appUniqueIdentifier,
      ),
    );
    return parameters;
  }

  Future<String> getLink({String date, String lessonId}) async {
    //TODO: this should change into something more personalized (maybe flutter web?) https://trello.com/c/nyvDNHuR
    Uri link = Uri.parse('https://example.com/registry/$date/$lessonId');

    DynamicLinkParameters parameters = _getParameters(link);
    final ShortDynamicLink dynamicUrl = await parameters.buildShortLink();
    final Uri uri = dynamicUrl.shortUrl;

    return uri.toString();
  }
}
