import 'package:flutter/material.dart';

class NotificationSnackBar extends SnackBar {
  NotificationSnackBar({
    Key key,
    @required String title,
    @required String body,
    @required VoidCallback onClose
  }) : super(
    key: key,
    content: ListTile(
      title: Text(title),
      subtitle: Text(body),
    ),
    duration: Duration(seconds: 2),
    action: SnackBarAction(
      label: 'Close',
      onPressed: onClose,
    ),
  );
}