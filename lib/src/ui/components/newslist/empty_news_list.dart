import 'package:checkin/src/localization/localization.dart';
import 'package:flutter/material.dart';

class EmptyNewsList extends StatelessWidget {
  static const String noNews = 'There is no news yet';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        noNews.i18n,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }
}
