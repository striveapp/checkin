import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;

  const NavigationButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(padding: EdgeInsets.only(left: 10)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: Theme.of(context)
                .textTheme
                .button!
                .apply(color: Theme.of(context).colorScheme.secondary, fontSizeFactor: 0.80),
          ),
          Icon(
            Icons.keyboard_arrow_right_outlined,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ],
      ),
    );
  }
}
