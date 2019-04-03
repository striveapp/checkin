import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/ui/teams_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthBloc authenticationBloc = BlocProvider.of<AuthBloc>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('Status'),
        ),
        body: Center(
        child:Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
          RaisedButton(
              child: Text('Go to Teams'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TeamsPage()),
                );
              }),
          RaisedButton(
            child: Text('logout'),
            onPressed: () {
              authenticationBloc.dispatch(LoggedOut());
            },
          ),
        ]))));
  }
}
