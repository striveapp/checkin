// @dart=2.9

import 'package:checkin/src/blocs/lesson_filter/bloc.dart';
import 'package:checkin/src/blocs/lessons/bloc.dart';
import 'package:checkin/src/repositories/lesson_config_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'filter_list_widget.dart';

class LessonsFilterDialog extends StatelessWidget {
  final List<String> selectedFilterList;
  final BuildContext parentContext;

  const LessonsFilterDialog({
    Key key,
    @required this.parentContext,
    @required this.selectedFilterList,
  }) : super(key: key);

  @override
  Widget build(_) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: parentContext.read<LessonsBloc>(),
        ),
        BlocProvider(
            create: (BuildContext context) => LessonFilterBloc(
                  lessonConfigRepository: parentContext.read<LessonConfigRepository>(),
                  userRepository: parentContext.read<UserRepository>(),
                ))
      ],
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Padding(
          padding: const EdgeInsets.only(
            left: 15,
            bottom: 60,
          ),
          child: FilterListWidget(selectedFilterList: selectedFilterList),
        ),
      ),
    );
  }
}
