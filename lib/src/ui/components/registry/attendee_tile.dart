import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/ui/components/user_image.dart';
import 'package:flutter/material.dart';

class AttendeeTile extends StatelessWidget {
  final Attendee attendee;
  final bool isCurrent;
  final bool isAccepted;

  static const String you = 'You';

  const AttendeeTile({
    Key key,
    @required this.attendee,
    this.isCurrent=false,
    this.isAccepted=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: ListTile(
            key: Key("tile-${attendee.email}"),
            leading: UserImage(
              userImage: attendee.imageUrl,
            ),
            title: Padding(
              padding: const EdgeInsets.only(left: 6),
              child: Text(
                "${attendee.name}${this.isCurrent ? " (${you.i18n})": ""}",
                style: this.isCurrent ?
                  Theme.of(context).textTheme.headline3.apply(color: Theme.of(context).accentColor.withAlpha(200)) :
                  Theme.of(context).textTheme.headline3
              ),
            ),
            trailing: Icon(_getTrailingIcon(), color: Theme.of(context).accentColor),
            onTap: () async {
              debugPrint("User tapped on ${attendee.name}");
              Navigator.of(context).pushNamed('stats/${attendee.email}');
            },
          ),
        ),
      ],
    );
  }

  _getTrailingIcon() {
    if(this.isAccepted) {
      return Icons.check_circle;
    }

    return Icons.radio_button_unchecked;
  }
}
