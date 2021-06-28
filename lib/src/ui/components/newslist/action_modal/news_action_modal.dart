// @dart=2.9

import 'package:checkin/src/blocs/news/news_bloc.dart';
import 'package:checkin/src/blocs/news/news_event.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsActionModal extends StatelessWidget {
  static const String pinNewsOnTop = "Pin news on top";
  static const String unpinNews = "Unpin news";
  static const String deleteNews = "Delete this news";

  final String newsId;
  final bool isPinned;
  final bool hasPinnedNews;

  const NewsActionModal({
    Key key,
    @required this.newsId,
    @required this.isPinned,
    @required this.hasPinnedNews,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      key: Key("newsActionModal"),
      child: Container(
        constraints: BoxConstraints(
          maxHeight: 160,
        ),
        child: Column(
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Icon(
                  Icons.maximize_rounded,
                  size: 50,
                  color: Colors.grey,
                ),
              ),
            ),
            Expanded(
              child: isPinned
                  ? NewsAction(
                      key: Key("unpinNewsAction"),
                      onTap: () async {
                        await context.read<NewsBloc>().add(UnpinNews(id: newsId));
                        Navigator.of(context).pop();
                      },
                      icon: Icons.push_pin_outlined,
                      text: unpinNews.i18n,
                    )
                  : NewsAction(
                      key: Key("pinNewsAction"),
                      onTap: () async {
                        if (hasPinnedNews) {
                          await context.read<NewsBloc>().add(ReplacePinnedNews(id: newsId));
                        } else {
                          await context.read<NewsBloc>().add(PinNews(id: newsId));
                        }
                        Navigator.of(context).pop();
                      },
                      icon: Icons.push_pin,
                      text: pinNewsOnTop.i18n,
                    ),
            ),
            Expanded(
              child: NewsAction(
                key: Key("deleteNewsAction"),
                onTap: () async {
                  await context.read<NewsBloc>().add(DeleteNews(id: newsId));
                  Navigator.of(context).pop();
                },
                icon: Icons.delete,
                text: deleteNews.i18n,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewsAction extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String text;

  const NewsAction({
    Key key,
    this.onTap,
    this.icon,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          children: [
            Icon(icon),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: Text(
                text,
                style: Theme.of(context).textTheme.headline3,
              ),
            )
          ],
        ),
      ),
    );
  }
}
