import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NotificationToast {
  static void show(BuildContext context, String title, String body,
      {Color backgroundColor = const Color(0xAA000000),
      Color textColor = Colors.white,
      double backgroundRadius = 18}) {
    NotificationView.dismiss();
    NotificationView.createView(title, body, context, backgroundColor, textColor, backgroundRadius);
  }
}

class NotificationView {
  static final NotificationView _singleton = new NotificationView._internal();

  factory NotificationView() {
    return _singleton;
  }

  NotificationView._internal();

  static OverlayState overlayState;
  static OverlayEntry _overlayEntry;
  static bool _isVisible = false;

  static void createView(String title, String body, BuildContext context, Color background,
      Color textColor, double backgroundRadius) async {
    overlayState = Overlay.of(context);

    Paint paint = Paint();
    paint.strokeCap = StrokeCap.square;
    paint.color = background;

    _overlayEntry = new OverlayEntry(
      builder: (BuildContext context) => NotificationWidget(
          widget: Container(
        width: MediaQuery.of(context).size.width,
        child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: Container(
              decoration: BoxDecoration(
                color: background,
                borderRadius: BorderRadius.circular(backgroundRadius),
              ),
              margin: EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: ListTile(
                title: Text(title,
                    softWrap: true,
                    style: TextStyle(fontSize: 16, color: textColor, fontWeight: FontWeight.bold)),
                subtitle:
                    Text(body, softWrap: true, style: TextStyle(fontSize: 15, color: textColor)),
              ),
            )),
      )),
    );
    _isVisible = true;
    overlayState.insert(_overlayEntry);
    await new Future.delayed(Duration(seconds: 3));
    dismiss();
  }

  static dismiss() async {
    if (!_isVisible) {
      return;
    }
    _isVisible = false;
    _overlayEntry?.remove();
  }
}

class NotificationWidget extends StatelessWidget {
  NotificationWidget({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return new Positioned(
        bottom: 30,
        child: Material(
          color: Colors.transparent,
          child: widget,
        ));
  }
}
