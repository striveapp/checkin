import 'package:checkin/src/blocs/lesson/registry/bloc.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/user.dart';
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
      child: Container(
        constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.53),
        child: BlocBuilder<RegistryBloc, RegistryState>(
            builder: (BuildContext context, RegistryState state) {
          if (state is RegistryUninitialized ||
              (state is RegistryLoaded && _isRegistryEmpty(state))) {
            return EmptyRegistry();
          }

          if (state is RegistryLoading) {
            return EmptyRegistry(
              isLoading: true,
            );
          }

          if (state is RegistryLoaded) {
            User currentUser = state.currentUser;

            return Column(
              key: Key('attendeeList'),
              children: <Widget>[
                if (_isUserInClass(state))
                  CurrentUserTile(
                      acceptedAttendees: state.acceptedAttendees,
                      currentUser: currentUser),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        AcceptedAttendees(
                            acceptedAttendees: state.acceptedAttendees,
                            currentUser: currentUser),
                        Attendees(
                            attendees: state.attendees,
                            currentUser: currentUser),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }

          return ErrorWidget(
              'Unknown State [$state] received in: attendees_list');
        }),
      ),
    );
  }

  bool _isUserInClass(RegistryLoaded state) {
    return state.isRegisteredUser || state.isAcceptedUser;
  }

  bool _isRegistryEmpty(RegistryLoaded state) =>
      [...state.attendees, ...state.acceptedAttendees].length == 0;
}

class Attendees extends StatelessWidget {
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
          .where((attendee) => attendee.email != currentUser.email)
          .map((attendee) => currentUser.isOwner
              ? Dismissible(
                  key: Key(attendee.email),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                  ),
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
                  ),
                )
              : AttendeeTile(
                  attendee: attendee,
                  selectedGymId: currentUser.selectedGymId,
                  isAccepted: false,
                ))
          .toList(),
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
