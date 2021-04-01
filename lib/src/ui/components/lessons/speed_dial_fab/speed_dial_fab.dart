import 'package:checkin/src/blocs/lessons/bloc.dart';
import 'package:checkin/src/ui/components/empty_widget.dart';
import 'package:checkin/src/ui/components/lessons/lessons_filter_dialog.dart';
import 'package:checkin/src/ui/components/lessons/update_calendar_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'animated_circular_button.dart';
import 'animated_open_speed_dial_button.dart';

class SpeedDialFab extends StatefulWidget {
  @override
  _SpeedDialFabState createState() => _SpeedDialFabState();
}

class _SpeedDialFabState extends State<SpeedDialFab> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 250),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonsBloc, LessonsState>(
      builder: (BuildContext context, LessonsState state) {
        List<String> selectedFilterList = state.maybeMap(
          lessonsLoaded: (LessonsLoaded state) => state.selectedFilterList,
          orElse: () => [],
        );

        if (state is LessonsLoaded) {
          return Stack(
            alignment: Alignment.bottomRight,
            children: [
              IgnorePointer(
                child: Container(
                  color: Colors.transparent,
                  height: 120.0,
                  width: 120.0,
                ),
              ),
              AnimatedCircularButton(
                icon: Icons.filter_list_outlined,
                parent: _controller,
                degrees: 270.0,
                onPressed: () async {
                  await showGeneralDialog(
                      context: context,
                      barrierColor: Colors.black54,
                      barrierDismissible: true,
                      barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
                      pageBuilder: (_, __, ___) => LessonsFilterDialog(
                            parentContext: context,
                            selectedFilterList: selectedFilterList,
                          ));
                },
              ),
              AnimatedCircularButton(
                icon: Icons.save,
                parent: _controller,
                degrees: 225.0,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => UpdateCalendarDialog().build(context),
                  );
                },
              ),
              AnimatedCircularButton(
                icon: Icons.add,
                parent: _controller,
                degrees: 180.0,
                onPressed: () => context.read<LessonsBloc>().add(CreateLesson(
                      selectedDay: state.selectedDay,
                    )),
              ),
              AnimatedOpenSpeedDialButton(
                parent: _controller,
              ),
            ],
          );
        }

        return EmptyWidget();
      },
    );
  }
}
