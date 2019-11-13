import 'package:checkin/src/blocs/registry/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/resources/lesson_repository.dart';
import 'package:checkin/src/resources/user_repository.dart';
import 'package:checkin/src/ui/components/attendees_list.dart';
import 'package:checkin/src/ui/components/base_app_bar.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:checkin/src/ui/components/lesson_infos.dart';
import 'package:checkin/src/ui/components/attendees_counter.dart';
import 'package:checkin/src/ui/components/registry_controls.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistryPage extends StatefulWidget {
  RegistryPage({
    Key key,
  }) : super(key: key);

  @override
  _RegistryState createState() {
    return _RegistryState();
  }
}

class _RegistryState extends State<RegistryPage> {
  final LessonRepository _lessonsRepository = LessonRepository();
  final UserRepository _userRepository = UserRepository();
  RegistryBloc _registryBloc;
  UserBloc _userBloc;

  @override
  void initState() {
    super.initState();
    _userBloc = BlocProvider.of<UserBloc>(context);
    _registryBloc = RegistryBloc(
        lessonRepository: _lessonsRepository, userRepository: _userRepository);
  }

  @override
  Widget build(BuildContext context) {
    final lessonId = ModalRoute.of(context).settings.arguments;
    _registryBloc.dispatch(LoadLesson(lessonId: lessonId));

    return Scaffold(
      appBar: BaseAppBar(
        //TODO: we should pass the name of the class here instead of "registry"
        title: Localization.of(context).registry,
      ),
      body: BlocBuilder(
        bloc: _registryBloc,
        builder: (BuildContext context, RegistryState state) {
          if (state is RegistryUninitialized || state is RegistryLoading) {
            return LoadingIndicator();
          }

          if (state is RegistryLoaded) {
            //TODO: should refactor to never use _userBloc.currentState, are we reactive yet?
            User currentUser =
                (_userBloc.currentState as UserSuccess).currentUser;
            Lesson currentLesson = state.lesson;

            return Container(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    LessonInfos(
                      lesson: currentLesson,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5),
                          child: AttendeesCounter(
                              attendees: currentLesson.attendees),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        AttendeesList(
                          isOwner: currentUser.isOwner,
                          isClassEmpty: _isClassEmpty(currentLesson),
                          isUserInClass:
                              _isUserInClass(currentLesson, currentUser),
                          attendeesList: currentLesson.attendees,
                          lessonId: lessonId,
                          currentUser: currentUser,
                          removeAttendee: (Attendee attendee) {
                            _removeAttendee(lessonId, attendee);
                          },
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        RegistryControls(
                          isOwner: currentUser.isOwner,
                          isUserInClass:
                              _isUserInClass(currentLesson, currentUser),
                          onPressRegisterClass: () {
                            _addAttendee(
                                lessonId, Attendee.fromUser(currentUser));
                          },
                          onPressUnregisterClass: () {
                            _removeAttendee(
                                lessonId, Attendee.fromUser(currentUser));
                          },
                          onPressedAcceptAll: !_isClassEmpty(currentLesson)
                              ? () {
                                  _acceptAll(currentLesson);
                                }
                              : null,
                        )
                      ],
                    ),
                  ]),
            ));
          }
          return ErrorWidget('Unknown State received in: registry_page');
        },
      ),
    );
  }

  //TODO: this will not work if the user changes his infos first and then attempt to unregister
  void _removeAttendee(String lessonId, Attendee attendee) {
    _registryBloc.dispatch(Unregister(lessonId: lessonId, attendee: attendee));
  }

  void _addAttendee(String lessonId, Attendee attendee) {
    _registryBloc.dispatch(Register(lessonId: lessonId, attendee: attendee));
  }

  void _acceptAll(Lesson lesson) {
    _registryBloc.dispatch(ConfirmAttendees(lesson: lesson));
  }

  bool _isUserInClass(Lesson currentLesson, User currentUser) {
    return currentLesson.containsUser(currentUser.email);
  }

  bool _isClassEmpty(Lesson currentLesson) {
    return currentLesson.attendees.length == 0;
  }

  @override
  void dispose() {
    super.dispose();
    _registryBloc.dispose();
  }
}
