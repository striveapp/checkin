import 'package:checkin/src/blocs/lesson_filter/bloc.dart';
import 'package:checkin/src/blocs/lessons/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/logging/logger.dart';
import 'package:checkin/src/repositories/lesson_config_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' hide Matrix4, Colors;
import 'package:flutter_bloc/flutter_bloc.dart';

import 'empty_widget.dart';
import 'lessons/filter_list_widget.dart';

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
        BlocBuilder<LessonsBloc, LessonsState>(
          builder: (BuildContext context, LessonsState state) {
            List<String> selectedFilterList = state.maybeMap(
                lessonsLoaded: (LessonsLoaded state) => state.selectedFilterList, orElse: () => []);

            if (state is LessonsLoaded) {
              return AnimatedCircularButton(
                icon: Icons.access_alarm_rounded,
                parent: _controller,
                degrees: 270.0,
                onPressed: () async {
                  Logger.log.d("a a a, i'm a cat");

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
                          ));
                },
              );
            }

            return EmptyWidget();
          },
        ),
        AnimatedCircularButton(
          icon: Icons.save,
          parent: _controller,
          degrees: 225.0,
          onPressed: () {
            Logger.log.d("a a a, fuck off");
          },
        ),
        BlocBuilder<LessonsBloc, LessonsState>(
          builder: (BuildContext context, LessonsState state) {
            if (state is LessonsLoaded) {
              return AnimatedCircularButton(
                icon: Icons.add,
                parent: _controller,
                degrees: 180.0,
                onPressed: () {
                  Logger.log.d("a a a, brr pup");
                  context.read<LessonsBloc>().add(CreateLesson(selectedDay: state.selectedDay));
                },
              );
            }

            return EmptyWidget();
          },
        ),
        AnimatedOpenSpeedDialButton(
          parent: _controller,
        ),
      ],
    );
  }
}

class AnimatedOpenSpeedDialButton extends StatefulWidget {
  final AnimationController parent;

  const AnimatedOpenSpeedDialButton({
    Key key,
    this.parent,
  }) : super(key: key);

  @override
  _AnimatedOpenSpeedDialButtonState createState() => _AnimatedOpenSpeedDialButtonState();
}

class _AnimatedOpenSpeedDialButtonState extends State<AnimatedOpenSpeedDialButton>
    with SingleTickerProviderStateMixin {
  Animation<double> _iconAnimation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    );
    _iconAnimation = CurvedAnimation(
      curve: Curves.linear,
      parent: _controller,
    );
    widget.parent.addStatusListener((status) {
      if (status == AnimationStatus.reverse) {
        _controller.reverse();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).accentColor,
        shape: BoxShape.circle,
      ),
      width: 55,
      height: 55,
      child: IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_close,
          progress: _iconAnimation,
        ),
        splashRadius: 30,
        onPressed: () {
          if (_controller.isCompleted) {
            widget.parent.reverse();
            _controller.reverse();
          } else {
            widget.parent.forward();
            _controller.forward();
          }
        },
      ),
    );
  }
}

class AnimatedCircularButton extends StatefulWidget {
  final IconData icon;
  final double degrees;
  final AnimationController parent;
  final VoidCallback onPressed;

  const AnimatedCircularButton({
    Key key,
    this.icon,
    this.parent,
    this.degrees,
    this.onPressed,
  }) : super(key: key);

  @override
  _AnimatedCircularButtonState createState() => _AnimatedCircularButtonState();
}

class _AnimatedCircularButtonState extends State<AnimatedCircularButton> {
  Animation _mainAnimation;
  Animation _rotationAnimation;
  Animation _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _mainAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: widget.parent,
      curve: Curves.fastOutSlowIn,
    ));
    _scaleAnimation = Tween<double>(begin: 0.4, end: 1.0).animate(CurvedAnimation(
      parent: widget.parent,
      curve: Curves.easeOut,
    ));
    _rotationAnimation = Tween<double>(begin: 180.0, end: 0.0).animate(CurvedAnimation(
      parent: widget.parent,
      curve: Curves.easeOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.parent,
      builder: (_, child) => Transform.translate(
        offset: Offset.fromDirection(radians(widget.degrees), _mainAnimation.value * 70),
        child: Transform(
          transform: Matrix4.rotationZ(radians(_rotationAnimation.value))
            ..scale(_scaleAnimation.value),
          alignment: Alignment.center,
          child: child,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          shape: BoxShape.circle,
        ),
        width: 40,
        height: 40,
        child: IconButton(
          icon: Icon(widget.icon),
          splashRadius: 25,
          onPressed: () {
            widget.onPressed();
            if (widget.parent.isCompleted) {
              widget.parent.reverse();
            }
          },
        ),
      ),
    );
  }
}
