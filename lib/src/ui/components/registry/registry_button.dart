// @dart=2.9

import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:flutter/material.dart';

class RegistryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color color;
  final bool isLoading;

  const RegistryButton({
    Key key,
    @required this.onPressed,
    this.text,
    this.color,
    this.isLoading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(primary: color),
        child: isLoading
            ? LoadingIndicator(
                width: 20,
                height: 20,
              )
            : Text(
                this.text.toUpperCase(),
                style: Theme.of(context).textTheme.button,
              ),
        onPressed: this.onPressed,
      ),
    );
  }
}
