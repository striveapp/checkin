import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/ui/components/user_image.dart';
import 'package:flutter/material.dart';

class AttendeeTile extends StatelessWidget {
  final Attendee attendee;
  final bool isCurrent;

  const AttendeeTile({
    Key key,
    @required this.attendee,
    this.isCurrent=false,
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
                "${attendee.name}${this.isCurrent ? " (${Localization.of(context).you})": ""}",
                style: this.isCurrent ?
                  Theme.of(context).textTheme.subtitle.apply(color: Theme.of(context).accentColor) :
                  Theme.of(context).textTheme.subtitle
              ),
            ),
            onTap: () async {
              debugPrint("User tapped on ${attendee.name}");
              //TODO: this should go to stats page of the user
              Navigator.of(context).pushNamed('profile/${attendee.email}');
            },
          ),
        ),
      ],
    );
  }
}
