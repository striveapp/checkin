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
                text: Localization.of(context).acceptAll,
              )
            : (_isUserInClass(currentLesson, currentUser)
                ? RegistryButton(
                    key: Key('unregisterClass'),
                    text: Localization.of(context).unregisterClass,
                    color: Color(0xFFEF5350),
                    onPressed: onPressUnregisterClass,
                  )
                : RegistryButton(
                    key: Key('registerClass'),
                    text: Localization.of(context).registerClass,
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
