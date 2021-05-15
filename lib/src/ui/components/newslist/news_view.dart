import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/author.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/ui/components/rounded_image.dart';
import 'package:flutter/material.dart';

class NewsView extends StatelessWidget {
  static const String beltColor = '%s Belt';

  final Author author;
  final String content;

  const NewsView({
    Key key,
    @required this.author,
    @required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RoundedImage(
          width: 50,
          height: 50,
          url: author.imageUrl,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 2.5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  author.name,
                  style: Theme.of(context).textTheme.headline5.apply(fontWeightDelta: 2),
                ),
                if (author.grade != null)
                  Column(
                    children: [
                      SizedBox(
                        height: 2.5,
                      ),
                      Text(
                        beltColor.i18n.fill([author.grade.name.i18n]),
                        key: Key("authorGrade"),
                        style: Theme.of(context).textTheme.bodyText1.apply(
                              color: Theme.of(context).textTheme.bodyText1.color.withAlpha(90),
                            ),
                      ),
                    ],
                  ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  content,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
