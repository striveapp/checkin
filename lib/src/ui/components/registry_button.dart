import 'package:flutter/material.dart';

class RegistryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color color;

  const RegistryButton({
    Key key,
    @required this.onPressed,
    @required this.text,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: RaisedButton(
        key: this.key,
        color: this.color,
        child: Text(
          this.text.toUpperCase(),
          style: Theme.of(context).textTheme.button,
        ),
        onPressed: this.onPressed,
      ),
    );
  }
}
