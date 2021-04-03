import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart' hide Matrix4;

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
          key: Key("icon_${widget.key.toString()}"),
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
