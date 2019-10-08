import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/ui/components/user_image.dart';
import 'package:flutter/material.dart';

class AttendeeTile extends StatelessWidget {
  final Attendee attendee;

  const AttendeeTile({Key key, @required this.attendee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: ListTile(
            key: Key("tile-${attendee.email}"),
            leading: UserImage(
              userImage: attendee.imageUrl,
              width: 50,
              height: 50,
            ),
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: 45),
              child: Text(
                attendee.name,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              ),
            ),
            onTap: () async {
              debugPrint("User tapped on ${attendee.name}");
              Navigator.of(context).pushNamed('profile/${attendee.email}');
            },
          ),
        ),
        Divider()
      ],
    );
  }
}
