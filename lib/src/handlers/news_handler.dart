import 'package:checkin/src/handlers/registerable_handler.dart';
import 'package:checkin/src/ui/pages/news_list_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart' hide Router;

class NewsHandler extends Handler implements RegisterableHandler {
  static final String newsId = "newsId";

  @override
  void registerRoute(FluroRouter router) {
    router.define(route, handler: this);
  }

  @override
  HandlerFunc get handlerFunc =>
      (BuildContext context, Map<String, List<String>> params) => NewsListPage(
            newsId: params[newsId][0],
          );

  String get route => "news/:$newsId";
}
