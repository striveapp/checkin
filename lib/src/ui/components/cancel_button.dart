import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CancelButton({Key key, this.text, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: Theme.of(context).colorScheme.error,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Text(
          text,
          style: Theme.of(context).textTheme.button,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
