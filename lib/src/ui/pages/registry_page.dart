import 'package:checkin/src/blocs/registry/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:checkin/src/ui/components/attendees_counter.dart';
import 'package:checkin/src/ui/components/attendees_list.dart';
import 'package:checkin/src/ui/components/base_app_bar.dart';
import 'package:checkin/src/ui/components/lesson_infos.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:checkin/src/ui/components/registry_controls.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistryPage extends StatelessWidget {
  final String lessonId;

  static const String registry = 'Registry';

  RegistryPage({
    Key key,
    @required this.lessonId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        //TODO: we should pass the name of the class here instead of "registry"
        title: RegistryPage.registry,
      ),
      body: BlocProvider<RegistryBloc>(
        create: (context) => RegistryBloc(
          lessonId: lessonId,
          lessonRepository: LessonRepository(),
          userBloc: BlocProvider.of<UserBloc>(context),
        ),
        child: BlocBuilder<RegistryBloc, RegistryState>(
          builder: (BuildContext context, RegistryState state) {
            if (state is RegistryUninitialized || state is RegistryLoading) {
              return LoadingIndicator();
            }

            if (state is RegistryLoaded) {
              Lesson currentLesson = state.currentLesson;
              User currentUser = state.currentUser;

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
                            currentUser: currentUser,
                            currentLesson: currentLesson,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RegistryControls(
                            currentUser: currentUser,
                            currentLesson: currentLesson,
                          )
                        ],
                      ),
                    ]),
              ));
            }
            return ErrorWidget('Unknown State [$state] received in: registry_page');
          },
        ),
      ),
    );
  }
}
