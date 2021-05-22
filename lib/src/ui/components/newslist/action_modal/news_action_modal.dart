import 'package:checkin/src/logging/logger.dart';
import 'package:flutter/material.dart';
import 'package:checkin/src/localization/localization.dart';

class NewsActionModal extends StatelessWidget {
  static const String pinNewsOnTop = "Pin news on top";
  static const String deleteNews = "Delete this news";

  const NewsActionModal({
    Key key,
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
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Icon(
                Icons.maximize_rounded,
                size: 50,
                color: Colors.grey,
              ),
            ),
            Expanded(
              child: NewsAction(
                onTap: () => Logger.log.i("imacat"),
                icon: Icons.push_pin,
                text: pinNewsOnTop.i18n,
              ),
            ),
            Expanded(
              child: NewsAction(
                onTap: () => Logger.log.i("imacat"),
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
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15),
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

