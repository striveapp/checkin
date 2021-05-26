import 'package:flutter/material.dart';

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
    _controller.dispose();
    super.dispose();
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
          color: Colors.white,
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
