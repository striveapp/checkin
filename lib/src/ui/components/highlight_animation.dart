import 'package:flutter/material.dart';

class HighlightAnimation extends StatefulWidget {
  final Widget child;

  HighlightAnimation({@required this.child});

  @override
  HighlightAnimationState createState() => HighlightAnimationState();
}

class HighlightAnimationState extends State<HighlightAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation _colorTween;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 2000));
    _colorTween = ColorTween(begin: Colors.amber.withOpacity(0.3), end: Colors.transparent)
        .animate(_animationController);

    _animationController.forward();

    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _colorTween,
        builder: (context, child) => Container(
            color: _colorTween.value,
            child: this.widget.child)
    );
  }
}