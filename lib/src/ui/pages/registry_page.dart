import 'package:checkin/src/api/api.dart';
import 'package:checkin/src/blocs/graduation/bloc.dart';
import 'package:checkin/src/blocs/lesson/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:checkin/src/repositories/stats_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/ui/components/base_app_bar.dart';
import 'package:checkin/src/ui/components/registry/lesson_infos.dart';
import 'package:checkin/src/ui/components/registry/registry.dart';
import 'package:checkin/src/util/graduation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

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
        title: DateFormat('d MMMM').format(DateTime.parse(this.date)),
      ),
      body: MultiBlocProvider(
          providers: [
            BlocProvider<LessonBloc>(
              create: (context) => LessonBloc(
                userBloc: BlocProvider.of<UserBloc>(context),
                lessonId: lessonId,
                date: date,
                lessonRepository:
                    RepositoryProvider.of<LessonRepository>(context),
                lessonApi: RepositoryProvider.of<LessonApi>(context),
              ),
            ),
          ],
          child: Container(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  LessonInfos(),
                  Registry(),
                ]),
          ))),
    );
  }
}
