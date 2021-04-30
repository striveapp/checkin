import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:flutter/material.dart';

class GradeCard extends StatelessWidget {
  final Grade grade;
  final VoidCallback onPressed;

  static const String beltColor = '%s Belt';

  GradeCard({this.grade, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        child: InkWell(
          onTap: onPressed,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 5),
            child: Row(
              children: <Widget>[
                grade.icon,
                Flexible(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(beltColor.i18n.fill([grade.name.i18n]),
                            style: Theme.of(context).textTheme.headline2),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          grade.description.i18n,
                          style: Theme.of(context).textTheme.headline3.apply(
                              color: Theme.of(context).textTheme.headline2.color.withAlpha(100),
                              fontSizeFactor: 0.8),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
