import 'package:checkin/src/blocs/registry/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'attendee_tile.dart';
import 'package:checkin/src/constants.dart' as constants;

class AttendeesList extends StatefulWidget {
  final User currentUser;
  final Lesson currentLesson;

  const AttendeesList({
    Key key,
    @required this.currentUser,
    @required this.currentLesson,
  }) : super(key: key);

  @override
  _AttendeesListState createState() => _AttendeesListState();
}

class _AttendeesListState extends State<AttendeesList> {
  RegistryBloc registryBloc;

  @override
  void initState() {
    super.initState();
    registryBloc = BlocProvider.of<RegistryBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    var currentLesson = widget.currentLesson;
    var currentUser = widget.currentUser;
    var attendeeListWithoutUser = getAttendeeListWithoutCurrentUser(currentLesson, currentUser);

    return Card(
      key: _isClassEmpty(currentLesson)
          ? Key('emptyClassCard')
          : Key('attendeeList'),
      margin: EdgeInsets.zero,
      child: Container(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height * 0.53),
          child: _isClassEmpty(currentLesson)
              ? Container(
                  alignment: Alignment(0, 0),
                  child: Text(
                    constants.emptyClass.i18n,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                )
              : Column(
                  children: <Widget>[
                    if (_isUserInClass(currentLesson, currentUser))
                      Column(
                        children: <Widget>[
                          AttendeeTile(
                            attendee: Attendee.fromUser(widget.currentUser),
                            isCurrent: true,
                          ),
                          Divider()
                        ],
                      ),
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: attendeeListWithoutUser.length,
                          itemBuilder: (BuildContext context, int index) {
                            if (index < attendeeListWithoutUser.length) {
                              final attendee = attendeeListWithoutUser[index];
                              return currentUser.isOwner
                                  ? Dismissible(
                                      //TODO: this should be changed with ID instead
                                      key: Key(attendee.email),
                                      direction: DismissDirection.endToStart,
                                      background: Container(
                                        color: Colors.red,
                                      ),
                                      onDismissed: (direction) {
                                        _removeAttendee(
                                            currentLesson.date, currentLesson.id, attendee);
                                      },
                                      child: AttendeeTile(attendee: attendee))
                                  : AttendeeTile(attendee: attendee);
                            }
                            return null;
                          }),
                    ),
                  ],
                )),
    );
  }

  List<Attendee> getAttendeeListWithoutCurrentUser(Lesson currentLesson, User currentUser) {
    return currentLesson.attendees
        .where((attendee) => attendee.email != currentUser.email)
        .toList();
  }

  //TODO: this will not work if the user changes his infos first and then attempt to unregister
  void _removeAttendee(String date, String lessonId, Attendee attendee) {
    registryBloc.add(Unregister(
      lessonId: lessonId,
      date: date,
      attendee: attendee,
    ));
  }

  bool _isUserInClass(Lesson currentLesson, User currentUser) {
    return currentLesson.containsUser(currentUser.email);
  }

  bool _isClassEmpty(Lesson currentLesson) {
    return currentLesson.attendees.length == 0;
  }
}
