import 'package:checkin/src/api/api.dart';
import 'package:checkin/src/blocs/registry/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:checkin/src/ui/components/registry/lesson_attendees_counter.dart';
import 'package:checkin/src/ui/components/registry/attendees_list.dart';
import 'package:checkin/src/ui/components/base_app_bar.dart';
import 'package:checkin/src/ui/components/registry/lesson_infos.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:checkin/src/ui/components/registry/registry_controls.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistryPage extends StatelessWidget {
  final String lessonId;
  final String date;

  static const String registry = 'Registry';

  RegistryPage({
    Key key,
    @required this.lessonId,
    @required this.date,
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
          date: date,
          lessonRepository: RepositoryProvider.of<LessonRepository>(context),
          lessonApi: RepositoryProvider.of<LessonApi>(context),
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
                      LessonInfos(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: LessonAttendeesCounter(),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          AttendeesList(),
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
