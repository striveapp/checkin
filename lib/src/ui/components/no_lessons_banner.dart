import 'package:checkin/src/localization/localization.dart';
import 'package:flutter/material.dart';

class NoLessonsBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      Localization.of(context).noClasses,
      key: Key('noClassesText'),
      style: Theme.of(context).textTheme.headline.apply(color: Colors.black87)
    );
  }
}
