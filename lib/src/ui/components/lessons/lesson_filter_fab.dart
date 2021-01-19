import 'package:checkin/src/blocs/lesson_filter/bloc.dart';
import 'package:checkin/src/blocs/lessons/bloc.dart';
import 'package:checkin/src/blocs/user/user_bloc.dart';
import 'package:checkin/src/repositories/lesson_config_repository.dart';
import 'package:checkin/src/ui/components/empty_widget.dart';
import 'package:checkin/src/ui/components/lessons/filter_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonsFilterFab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonsBloc, LessonsState>(
      builder: (BuildContext context, LessonsState state) {
        List<String> selectedFilterList = state.maybeMap(
            lessonsLoaded: (LessonsLoaded state) => state.selectedFilterList,
            lessonsLoadedEmpty: (LessonsLoadedEmpty state) => state.selectedFilterList,
            orElse: () => []);

        if (state is LessonsLoaded || state is LessonsLoadedEmpty) {
          return FloatingActionButton(
            key: Key("lessonFilterFab"),
            onPressed: () async {
              await showGeneralDialog(
                  context: context,
                  barrierColor: Colors.black54,
                  barrierDismissible: true,
                  barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
                  pageBuilder: (_, __, ___) => MultiBlocProvider(
                        providers: [
                          BlocProvider.value(
                            value: context.read<LessonsBloc>(),
                          ),
                          BlocProvider.value(
                            value: context.read<UserBloc>(),
                          ),
                          BlocProvider(
                              create: (BuildContext context) => LessonFilterBloc(
                                    lessonConfigRepository: context.read<LessonConfigRepository>(),
                                    userBloc: context.read<UserBloc>(),
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
                      ));
            },
            child: buildIcon(selectedFilterList.length),
          );
        }

        return EmptyWidget();
      },
    );
  }

  Icon buildIcon(int selectedFilters) {
    switch (selectedFilters) {
      case 0:
        return Icon(Icons.filter_list_outlined);
      case 1:
        return Icon(Icons.filter_1);
      case 2:
        return Icon(Icons.filter_2);
      case 3:
        return Icon(Icons.filter_3);
      case 4:
        return Icon(Icons.filter_4);
      case 5:
        return Icon(Icons.filter_5);
      case 6:
        return Icon(Icons.filter_6);
      case 7:
        return Icon(Icons.filter_7);
      case 8:
        return Icon(Icons.filter_8);
      case 9:
        return Icon(Icons.filter_9);
      default:
        return Icon(Icons.filter_9_plus);
    }
  }
}
