import 'package:checkin/src/blocs/registry/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/ui/components/registry/remove_student_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'attendee_tile.dart';
import 'current_user_tile.dart';
import 'empty_registry.dart';

class AttendeesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      child: BlocBuilder<RegistryBloc, RegistryState>(
          buildWhen: (RegistryState previous, RegistryState current) =>
              !(current is RegistryLoading),
          builder: (BuildContext context, RegistryState state) {
            return state.maybeMap(
                registryLoaded: (RegistryLoaded state) {
                  User currentUser = state.currentUser;
                  Lesson currentLesson = state.currentLesson;

                  return Container(
                    foregroundDecoration: currentLesson.isClosed
                        ? BoxDecoration(
                            color: Colors.grey,
                            backgroundBlendMode: BlendMode.saturation,
                          )
                        : null,
                    child: state.isEmptyRegistry
                        ? EmptyRegistry(
                            isDisabled: currentLesson.isClosed,
                          )
                        : Column(
                            key: Key('attendeeList'),
                            children: <Widget>[
                              if (_isUserInClass(state))
                                CurrentUserTile(
                                    acceptedAttendees: currentLesson.acceptedAttendees,
                                    currentUser: currentUser),
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: <Widget>[
                                      AcceptedAttendees(
                                          acceptedAttendees: currentLesson.acceptedAttendees,
                                          currentUser: currentUser),
                                      Attendees(
                                          attendees: currentLesson.attendees,
                                          currentUser: currentUser),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                  );
                },
                orElse: () => EmptyRegistry());
          }),
    );
  }

  bool _isUserInClass(RegistryLoaded state) {
    return state.isRegisteredUser || state.isAcceptedUser;
  }
}

class Attendees extends StatelessWidget {
  static const String removeStudent = 'Remove';

  final User currentUser;
  final List<Attendee> attendees;

  const Attendees({
    Key key,
    @required this.currentUser,
    @required this.attendees,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: attendees
          .asMap()
          .entries
          .where((attendeeEntry) => attendeeEntry.value.email != currentUser.email)
          .map((attendeeEntry) {
        var attendee = attendeeEntry.value;
        int index = attendeeEntry.key;
        return currentUser.isOwner
            ? Dismissible(
                key: Key(attendee.email),
                direction: DismissDirection.endToStart,
                confirmDismiss: (DismissDirection direction) async {
                  return await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return RemoveStudentDialog();
                    },
                  );
                },
                background: Container(
                    color: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    alignment: AlignmentDirectional.centerEnd,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.delete, color: Colors.white),
                        Text(removeStudent.i18n,
                            style: Theme.of(context).textTheme.bodyText1.apply(color: Colors.white))
                      ],
                    )),
                onDismissed: (direction) {
                  BlocProvider.of<RegistryBloc>(context)
                    ..add(Unregister(
                      gymId: currentUser.selectedGymId,
                      attendee: attendee,
                    ));
                },
                child: AttendeeTile(
                    attendee: attendee,
                    selectedGymId: currentUser.selectedGymId,
                    isAccepted: false,
                    showSessionsWarning: true,
                    showGraduationIndication: true,
                    showDismissibleCue: index == 0 // only show on first element
                    ),
              )
            : AttendeeTile(
                attendee: attendee,
                selectedGymId: currentUser.selectedGymId,
                isAccepted: false,
              );
      }).toList(),
    );
  }
}

class AcceptedAttendees extends StatelessWidget {
  final User currentUser;
  final List<Attendee> acceptedAttendees;

  const AcceptedAttendees({
    Key key,
    @required this.currentUser,
    @required this.acceptedAttendees,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: acceptedAttendees
          .where((attendee) => attendee.email != currentUser.email)
          .map((attendee) => AttendeeTile(
                attendee: attendee,
                selectedGymId: currentUser.selectedGymId,
                isAccepted: true,
                showGraduationIndication: currentUser.isOwner,
              ))
          .toList(),
    );
  }
}
