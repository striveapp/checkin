import 'package:flutter/material.dart';

class AttendeesList extends StatelessWidget {
  final List<String> attendeeList;

  const AttendeesList({Key key, @required this.attendeeList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment(0.0, 0.0),
      margin: EdgeInsets.all(15.0),
      constraints: BoxConstraints(
          maxHeight: 300.0,
      ),
      decoration: new BoxDecoration(
          border: new Border.all(color: Colors.blueAccent)
      ),
      child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            if (index < this.attendeeList.length) {
              return AttendeeTile(attendee: this.attendeeList[index]);
            }
          }
      ),
    );
  }
}

class AttendeeTile extends StatelessWidget {
  final String attendee;

  const AttendeeTile({Key key, @required this.attendee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(attendee),
    );
  }
}