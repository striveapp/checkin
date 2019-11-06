import 'package:checkin/src/blocs/registry/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/resources/lesson_repository.dart';
import 'package:checkin/src/resources/user_repository.dart';
import 'package:checkin/src/ui/components/attendees_list.dart';
import 'package:checkin/src/ui/components/base_app_bar.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:checkin/src/ui/components/lesson_infos.dart';
import 'package:checkin/src/ui/components/attendees_counter.dart';
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
            Lesson currentLesson = state.lesson;

            return Container(
                child: Padding(
                  padding: EdgeInsets.only(top: 30, left: 15, right: 15),
                  child: Column(
                      children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 25),
                      child: LessonInfos(lesson: currentLesson,),
                    ),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: AttendeesCounter(attendees: currentLesson.attendees),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          child: AttendeesList(
                            attendeeList: currentLesson.attendees ?? [],
                            isOwner: _isOwnerUser(),
                            lessonId: lessonId,
                            removeAttendee: (Attendee attendee) {
                              _removeAttendee(lessonId, attendee);
                            },
                          ),
                        ),
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

  void _removeAttendee(lessonId, Attendee attendee) {
    _registryBloc.dispatch(Unregister(
        lessonId: lessonId,
        attendee: attendee));
  }

  bool _isOwnerUser() {
    return (_userBloc.currentState as UserSuccess).currentUser.isOwner;
  }

  @override
  void dispose() {
    // todo capire meglio il problema Unhandled Exception: Bad state: Cannot add new events after calling close
    // è risuccesso da indagare!
    super.dispose();
    _registryBloc.dispose();
  }
}
