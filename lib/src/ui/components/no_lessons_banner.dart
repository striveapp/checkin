import 'package:checkin/src/localization/localization.dart';
import 'package:flutter/material.dart';

class NoLessonsBanner extends StatelessWidget {
  static const String noClasses = 'There\'s no classes today';

  @override
  Widget build(BuildContext context) {
    return Text(
      NoLessonsBanner.noClasses.i18n,
      key: Key('noClassesText'),
      style: Theme.of(context).textTheme.headline1.apply(color: Colors.black87)
    );
  }
}
