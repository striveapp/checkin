import 'package:flutter/material.dart';

//var _onPressedAcceptAll;
//var _onPressRegisterClass;
//var _onPressUnregisterClass;

//             todo should refactor to never use _userBloc.currentState, are we reactive yet?
//            User currentUser = (_userBloc.currentState as UserSuccess)
//                .currentUser;
//
//            Lesson currentLesson = state.lesson;
//
//            if (!currentLesson.containsUser(currentUser.email)) {
//              _onPressRegisterClass = () {
//                _registryBloc.dispatch(Register(
//                    lessonId: lessonId,
//                    attendee: Attendee.fromUser(currentUser)));
//              };
//            } else {
//              //TODO: this will not work if the user changes his infos first and then attempt to unregister
//              _onPressUnregisterClass = () {
//                  _removeAttendee(lessonId, Attendee.fromUser(currentUser));
//              };
//            }
//
//            if (currentLesson.attendees != null) {
//              _onPressedAcceptAll = currentLesson.attendees.isNotEmpty
//                  ? () => _registryBloc.dispatch(ConfirmAttendees(
//                  lessonId: lessonId, attendees: currentLesson.attendees))
//                  : null;
//            }


//if (!_isOwnerUser() &&
//!currentLesson.containsUser(currentUser.email))
//RaisedButton(
//color: Colors.green,
//child: Padding(
//padding: const EdgeInsets.symmetric(vertical: 15),
//child: Text(Localization.of(context).registerClass,
//key: Key('attendClass'),
//style: TextStyle(
//fontSize: 18,
//fontFamily: "Roboto",
//color: Colors.white,
//fontWeight: FontWeight.w600)),
//),
//onPressed: _onPressRegisterClass,
//),
//if (!_isOwnerUser() &&
//currentLesson.containsUser(currentUser.email))
//RaisedButton(
//color: Colors.red,
//child: Padding(
//padding: const EdgeInsets.symmetric(vertical: 15),
//child: Text(Localization.of(context).unregisterClass,
//key: Key('unattendClass'),
//style: TextStyle(
//fontSize: 18,
//fontFamily: "Roboto",
//color: Colors.white,
//fontWeight: FontWeight.w600)),
//),
//onPressed: _onPressUnregisterClass,
//),
//if (_isOwnerUser())
//RaisedButton(
//color: Colors.green,
//child: Padding(
//padding: const EdgeInsets.symmetric(vertical: 15),
//child: Text(Localization.of(context).acceptAll,
//key: Key('acceptAll'),
//style: TextStyle(
//fontSize: 18,
//fontFamily: "Roboto",
//color: Colors.white,
//fontWeight: FontWeight.w600)),
//),
//onPressed: _onPressedAcceptAll,
//),
//if (isInDebugMode)
//RaisedButton(
//key: Key('logoutButton'),
//color: Colors.red,
//child: Text(Localization.of(context).logout,
//style: TextStyle(
//fontSize: 18,
//color: Colors.white,
//fontWeight: FontWeight.w600)),
//onPressed: () {
////TODO: check if a best solution can be applied here: https://github.com/felangel/bloc/issues/400
////TODO: we checked and is not enough
//debugPrint("Logging out from registry!");
//Navigator.pushNamedAndRemoveUntil(
//context, "/", (route) => false);
//_authBloc.dispatch(LogOut());
//},
//),


class RegistryControls extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
