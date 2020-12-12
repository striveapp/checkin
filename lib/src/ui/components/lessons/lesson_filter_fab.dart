import 'package:checkin/src/ui/components/lessons/filter_list_widget.dart';
import 'package:flutter/material.dart';

class LessonsFilterFab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      key: Key("lessonFilterFab"),
      onPressed: () async {
        await showGeneralDialog(
          context: context,
          barrierColor: Colors.black54,
          barrierDismissible: true,
          barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
          pageBuilder: (_, __, ___) => Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15,
                bottom: 60,
              ),
              child: FilterListWidget(
                filterList: [
                  "BJJ Advanced",
                  "BJJ Basic",
                  "BJJ Intermediate",
                  "Open Mat",
                  "Yoga",
                ],
                selectedFilterList: ["Yoga"],
              ),
            ),
          ),
        );
      },
      child: buildIcon(),
    );
  }

  Icon buildIcon() {
    //TODO lessonConfig: connect this with the bloc
    var numberOfFilters = 0;
    switch(numberOfFilters) {
      case 0:
        return Icon(Icons.filter_list_outlined);
      case 1:
        return Icon(Icons.filter_1);
      default:
        return Icon(Icons.filter_9_plus);
    }
  }
}
