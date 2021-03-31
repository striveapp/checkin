import 'package:checkin/src/blocs/lessons/bloc.dart';
import 'package:checkin/src/ui/components/empty_widget.dart';
import 'package:checkin/src/ui/components/lessons/lessons_filter_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonsFilterFab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonsBloc, LessonsState>(
      builder: (BuildContext context, LessonsState state) {
        List<String> selectedFilterList = state.maybeMap(
            lessonsLoaded: (LessonsLoaded state) => state.selectedFilterList,
            orElse: () => []);

        if (state is LessonsLoaded) {
          return FloatingActionButton(
            key: Key("lessonFilterFab"),
            onPressed: () async {
              await showGeneralDialog(
                  context: context,
                  barrierColor: Colors.black54,
                  barrierDismissible: true,
                  barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
                  pageBuilder: (_, __, ___) => LessonsFilterDialog(selectedFilterList: selectedFilterList));
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
