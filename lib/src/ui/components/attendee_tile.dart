import 'package:checkin/src/models/attendee.dart';
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
            leading: ClipRRect(
                borderRadius: BorderRadius.circular(50.0),
                child: Image.network(attendee.imageUrl, width: 50, height: 50)),
            title: Padding(
              padding: EdgeInsets.symmetric(horizontal: 45),
              child: Text(attendee.name, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),),
            ),
          ),
        ),
        Divider()
      ],
    );
  }
}
