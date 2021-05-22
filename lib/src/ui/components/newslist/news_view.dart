import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/logging/logger.dart';
import 'package:checkin/src/models/author.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/ui/components/rounded_image.dart';
import 'package:flutter/material.dart';
import 'package:platform/platform.dart';
import 'package:timeago/timeago.dart' as timeago;

class NewsView extends StatelessWidget {
  static const String beltColor = '%s Belt';

  final Author author;
  final String content;
  final int timestamp;

  const NewsView({
    Key key,
    @required this.author,
    @required this.content,
    @required this.timestamp,
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
                Row(
                  children: [
                    Text(
                      author.name,
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .apply(fontWeightDelta: 2),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "• ${_timeAgo()}",
                      style: Theme.of(context).textTheme.bodyText1.apply(
                          color: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .color
                              .withAlpha(90)),
                    ),
                    Expanded(
                        child: Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Transform.scale(
                          scale: 0.8,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            constraints: BoxConstraints(),
                            icon: Icon(
                              Icons.more_vert,
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyText1
                                  .color
                                  .withAlpha(90),
                            ),
                            onPressed: () {
                              showModalBottomSheet(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(15)),
                                  ),
                                  context: context,
                                  isScrollControlled: true,
                                  builder: (_) => SafeArea(
                                        key: Key("newsModal"),
                                        child: Container(
                                          constraints: BoxConstraints(
                                            maxHeight: 160,
                                          ),
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 10.0),
                                                child: Icon(
                                                  Icons.maximize_rounded,
                                                  size: 50,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                              NewsAction(
                                                onTap: () =>
                                                    Logger.log.i("imacat"),
                                                icon: Icons.push_pin,
                                                text: "Pin news on top".i18n,
                                              ),
                                              NewsAction(
                                                onTap: () =>
                                                    Logger.log.i("imacat"),
                                                icon: Icons.delete,
                                                text: "Delete this news".i18n,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ));
                            },
                          )),
                    )),
                  ],
                ),
                if (author.grade != null)
                  Column(
                    children: [
                      SizedBox(
                        height: 2.5,
                      ),
                      Text(beltColor.i18n.fill([author.grade.name.i18n]),
                          key: Key("authorGrade"),
                          style: Theme.of(context).textTheme.bodyText1),
                    ],
                  ),
                SizedBox(
                  height: 7.5,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Text(
                    content,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String _timeAgo() {
    var localeShort =
        LocalPlatform().localeName.replaceAll(RegExp(r'_.*'), "_short");
    return timeago.format(DateTime.fromMillisecondsSinceEpoch(timestamp),
        locale: localeShort);
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
            Text(
              text,
              style: Theme.of(context).textTheme.headline3,
            )
          ],
        ),
      ),
    );
  }
}
