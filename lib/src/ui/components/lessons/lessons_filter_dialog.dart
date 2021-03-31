import 'package:checkin/src/blocs/lesson_filter/bloc.dart';
import 'package:checkin/src/blocs/lessons/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/repositories/lesson_config_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'filter_list_widget.dart';

class LessonsFilterDialog extends StatelessWidget {
  const LessonsFilterDialog({
    Key key,
    @required this.selectedFilterList,
  }) : super(key: key);

  final List<String> selectedFilterList;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: context.read<LessonsBloc>(),
        ),
        BlocProvider.value(
          value: context.read<UserBloc>(),
        ),
        BlocProvider(
            create: (BuildContext context) => LessonFilterBloc(
              lessonConfigRepository:
              context.read<LessonConfigRepository>(),
              userRepository: context.read<UserRepository>(),
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
