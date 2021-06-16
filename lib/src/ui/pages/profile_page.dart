import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  final String userEmail;

  const ProfilePage({
    Key key,
    @required this.userEmail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: <Widget>[],
          ),
        ),
      ),
    );
  }
}
