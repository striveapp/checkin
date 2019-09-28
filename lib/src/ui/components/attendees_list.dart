import 'package:checkin/src/blocs/lessons/bloc.dart';
import 'package:checkin/src/blocs/lessons/lessons_event.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'attendee_tile.dart';
import 'loading_indicator.dart';

class AttendeesList extends StatefulWidget {
  final List<Attendee> attendeeList;
  final bool isOwner;
  final LessonsBloc lessonsBloc;
  final String lessonId;

  const AttendeesList({
    Key key,
    @required this.attendeeList,
    @required this.isOwner,
    @required this.lessonId,
    @required this.lessonsBloc,
  }) : super(key: key);

  @override
  _AttendeesListState createState() => _AttendeesListState();
}

class _AttendeesListState extends State<AttendeesList> {
  LessonsBloc get _lessonsBloc => widget.lessonsBloc;
  List<Attendee> get _attendeeList => widget.attendeeList;
  bool get isOwner => widget.isOwner;
  String get lessonId => widget.lessonId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonsEvent, LessonsState>(
      bloc: _lessonsBloc,
      builder: (BuildContext context, LessonsState state) {
        if (state is LessonsUninitialized) {
          return LoadingIndicator();
        }

        if (state is LessonsLoaded) {
          if (_attendeeList.length == 0) {
            return Card(
                key: Key('emptyClassCard'),
                child: Container(
              constraints: BoxConstraints.expand(height: 250.0),
              alignment: Alignment(0, 0),
              child: Text(
                Localization.of(context).emptyClass,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18),
              ),
            ));
          }
          return Card(
            child: Container(
              constraints: BoxConstraints.expand(height: 250.0),
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: _attendeeList.length,
                  itemBuilder: (BuildContext context, int index) {
                    if (index < _attendeeList.length) {
                      final attendee = _attendeeList[index];
                      return isOwner
                          ? Dismissible(
                        //TODO: this should be changed with ID instead
                          key: Key(attendee.email),
                          direction: DismissDirection.endToStart,
                          background: Container(color: Colors.red,),
                          onDismissed: (direction) {
                            _lessonsBloc.dispatch(Unregister(
                                lessonId: lessonId,
                                attendee: attendee));
                          },
                          child: AttendeeTile(attendee: attendee))
                          : AttendeeTile(attendee: attendee);
                    }
                    return null;
                  }),
            ),
          );
        }
        return ErrorWidget('Unknown State received in: attendees_list');
      },
    );
  }
}
