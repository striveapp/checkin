// @dart=2.9

import 'package:checkin/app_config.dart';
import 'package:checkin/src/repositories/dynamic_link_repository.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';

class DynamicLinkProvider extends DynamicLinkRepository {
  final AppConfig appConfig;

  DynamicLinkProvider({@required this.appConfig});

  DynamicLinkParameters _getParameters(Uri link) {
    return DynamicLinkParameters(
      uriPrefix: 'https://${appConfig.dynamicLinkDomain}',
      link: link,
      androidParameters: AndroidParameters(
        packageName: appConfig.appUniqueIdentifier,
      ),
      iosParameters: IosParameters(
        bundleId: appConfig.appUniqueIdentifier,
      ),
    );
  }

  @override
  Future<String> getRegistryLink(String date, String lessonId) async {
    //TODO: this should change into something more personalized (maybe flutter web?) https://trello.com/c/nyvDNHuR
    Uri link = Uri.parse('https://example.com/registry/$date/$lessonId');

    DynamicLinkParameters parameters = _getParameters(link);
    final ShortDynamicLink dynamicUrl = await parameters.buildShortLink();
    final Uri uri = dynamicUrl.shortUrl;

    return uri.toString();
  }
}
