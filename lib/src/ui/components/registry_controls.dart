import 'package:checkin/src/blocs/registry/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/ui/components/registry_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistryControls extends StatefulWidget {
  final User currentUser;
  final Lesson currentLesson;
  static const String unregisterClass = 'Unregister from class';
  static const String registerClass = 'Register to class';
  static const String acceptAll = 'Accept all';

  const RegistryControls({
    Key key,
    @required this.currentLesson,
    @required this.currentUser,
  }) : super(key: key);

  @override
  _RegistryControlsState createState() => _RegistryControlsState();
}

class _RegistryControlsState extends State<RegistryControls> {
  RegistryBloc registryBloc;

  @override
  void initState() {
    registryBloc = BlocProvider.of<RegistryBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistryBloc, RegistryState>(
      builder: (BuildContext context, RegistryState state) {
        var currentLesson = widget.currentLesson;
        var currentUser = widget.currentUser;

        var onPressUnregisterClass = () {
          registryBloc.add(Unregister(
            lessonId: currentLesson.id,
            attendee: Attendee.fromUser(currentUser),
          ));
        };

        var onPressRegisterClass = () {
          registryBloc.add(Register(
            lessonId: currentLesson.id,
            attendee: Attendee.fromUser(currentUser),
          ));
        };

        var onPressAcceptAll = !_isClassEmpty(currentLesson)
            ? () {
                registryBloc
                    .add(ConfirmAttendees(lesson: currentLesson));
              }
            : null;

        return currentUser.isOwner
            ? RegistryButton(
                key: Key('acceptAll'),
                onPressed: onPressAcceptAll,
                text: RegistryControls.acceptAll.i18n,
              )
            : (_isUserInClass(currentLesson, currentUser)
                ? RegistryButton(
                    key: Key('unregisterClass'),
                    text: RegistryControls.unregisterClass.i18n,
                    color: Color(0xFFEF5350),
                    onPressed: onPressUnregisterClass,
                  )
                : RegistryButton(
                    key: Key('registerClass'),
                    text: RegistryControls.registerClass.i18n,
                    onPressed: onPressRegisterClass,
                  ));
      },
    );
  }

  bool _isUserInClass(Lesson currentLesson, User currentUser) {
    return currentLesson.containsUser(currentUser.email);
  }

  bool _isClassEmpty(Lesson currentLesson) {
    return currentLesson.attendees.length == 0;
  }
}
