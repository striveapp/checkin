import 'package:checkin/src/blocs/registry/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/ui/components/registry_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistryControls extends StatelessWidget {
  final VoidCallback disabledButton = null;
  final Lesson currentLesson;
  final User currentUser;
  static const String unregisterClass = 'Unregister from class';
  static const String registerClass = 'Register to class';
  static const String acceptAll = 'Accept all';

  const RegistryControls({
    Key key,
    @required this.currentLesson,
    @required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VoidCallback onPressUnregisterClass = () {
      BlocProvider.of<RegistryBloc>(context).add(Unregister(
        lessonId: this.currentLesson.id,
        date: currentLesson.date,
        attendee: Attendee.fromUser(currentUser),
      ));
    };

    VoidCallback onPressRegisterClass = () {
      BlocProvider.of<RegistryBloc>(context).add(Register(
        lessonId: currentLesson.id,
        date: currentLesson.date,
        attendee: Attendee.fromUser(currentUser),
      ));
    };

    VoidCallback onPressAcceptAll = () {
      return !_isClassEmpty(currentLesson)
          ? () {
        BlocProvider.of<RegistryBloc>(context).add(ConfirmAttendees(lesson: currentLesson));
      } : disabledButton;
    };

    if(currentUser.isOwner) {
      return RegistryButton(
        key: Key('acceptAll'),
        onPressed: onPressAcceptAll,
        text: RegistryControls.acceptAll.i18n,
      );
    }

    if( currentLesson.isUserAccepted(currentUser.email)) {
      return RegistryButton(
        key: Key('acceptedInClass'),
        text: RegistryControls.registerClass.i18n,
        onPressed: disabledButton,
      );
    }

    if(currentLesson.isUserRegistered(currentUser.email)) {
      return RegistryButton(
        key: Key('unregisterClass'),
        text: RegistryControls.unregisterClass.i18n,
        color: Theme.of(context).buttonTheme.colorScheme.error,
        onPressed: onPressUnregisterClass,
      );
    }

    return RegistryButton(
      key: Key('registerClass'),
      text: RegistryControls.registerClass.i18n,
      onPressed: onPressRegisterClass,
    );
  }

  bool _isClassEmpty(Lesson currentLesson) {
    return currentLesson.attendees.length == 0;
  }
}
