import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Center(
    child: SizedBox(
      width: 40.0,
        height: 40.0,
        child: CircularProgressIndicator(key: Key('loadingIndicator'),)),
  );
}