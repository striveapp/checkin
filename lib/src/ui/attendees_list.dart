import 'package:checkin/src/models/user.dart';
import 'package:flutter/material.dart';

class AttendeesList extends StatelessWidget {
  final List<User> attendeeList;

  const AttendeesList({Key key, @required this.attendeeList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (this.attendeeList.length == 0) {
      return Card(
          child: Container(
        constraints: BoxConstraints.expand(width: 350.0, height: 150.0),
        alignment: Alignment(0, 0),
        child: Text(
          'Empty class',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
        ),
      ));
    }

    return Card(
      child: Container(
        constraints: BoxConstraints.expand(width: 350.0, height: 150.0),
        child: ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              if (index < this.attendeeList.length) {
                return AttendeeTile(attendee: this.attendeeList[index].name);
              }
            }),
      ),
    );
  }
}

class AttendeeTile extends StatelessWidget {
  final String attendee;

  const AttendeeTile({Key key, @required this.attendee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: const Icon(Icons.account_circle, size: 40,),
          title: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 45),
            child: Text(attendee, style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),),
          ),
        ),
        Divider()
      ],
    );
  }
}
