import 'package:checkin/src/ui/components/empty_widget.dart';
import 'package:flutter/material.dart';

class DismissibleCue extends StatefulWidget {
  DismissibleCue({Key key}) : super(key: key);

  @override
  _DismissibleCueState createState() => _DismissibleCueState();
}

class _DismissibleCueState extends State<DismissibleCue> with SingleTickerProviderStateMixin {
  static const int duration = 600;

  AnimationController _controller;
  Animation<Offset> _offsetAnimation;
  Animation<double> _fadeAnimation;
  bool running;

  @override
  void initState() {
    super.initState();
    running = false;
    initSlide();
    initFade();

    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        running = true;
      });
      TickerFuture tickerFuture = _controller.repeat(
        reverse: false,
      );

      // only display it 3 times
      tickerFuture.timeout(Duration(milliseconds: (duration * 3) - 200), onTimeout: () {
        _controller.stop(canceled: true);
        setState(() {
          // after 3 times display EmptyWidget
          running = false;
        });
      });

    });
  }

  void initSlide() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: duration),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0.5, 0.0),
      end: const Offset(-0.2, 0.0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));
  }

  void initFade() {
    _fadeAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.linear,
    ));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (running) {
      return FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _offsetAnimation,
          child: Container(
            child: Wrap(
              children: [Icon(Icons.arrow_back_ios), Icon(Icons.arrow_back_ios)],
              spacing: -15,
            ),
          ),
        ),
      );
    }

    return EmptyWidget();
  }
}
