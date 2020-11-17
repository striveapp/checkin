import 'package:checkin/src/api/lesson_api.dart';
import 'package:checkin/src/blocs/registry/bloc.dart';
import 'package:checkin/src/blocs/registry/registry_bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:checkin/src/ui/components/base_app_bar.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:checkin/src/ui/components/registry/lesson_infos.dart';
import 'package:checkin/src/ui/components/registry/registry.dart';
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
            BlocProvider<RegistryBloc>(
              create: (context) =>
                  RegistryBloc(
                    lessonId: lessonId,
                    lessonDate: date,
                    lessonApi: RepositoryProvider.of<LessonApi>(context),
                    lessonRepository: RepositoryProvider.of<LessonRepository>(context),
                    userBloc: BlocProvider.of<UserBloc>(context),
                  ),
            ),
          ],
          // todo this logic can be used when we extract a LoadingDialogBloc https://trello.com/c/YqSqs0tl
          child: BlocListener<RegistryBloc, RegistryState>(
            listener: (BuildContext context, RegistryState state) {
              if (state is RegistryLoading) {
                showDialog(context: context,
                  child: LoadingIndicator(),
                  barrierDismissible: false,
                  routeSettings: RouteSettings(name: "dialog"),);
              }
              if (state is RegistryLoaded) {
                Navigator.of(context).popUntil((route) => route.settings.name != "dialog");
              }
            },
            child: SafeArea(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                    LessonInfos(),
                    Registry(),
                  ]),
                ),
              ),
            ),
          )),
    );
  }
}
