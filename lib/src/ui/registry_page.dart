import 'package:checkin/src/blocs/auth/auth_bloc.dart';
import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/blocs/class/bloc.dart';
import 'package:checkin/src/resources/class_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegistryPage extends StatefulWidget {
  RegistryPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RegistryState createState() {
    return _RegistryState();
  }
}

class _RegistryState extends State<RegistryPage> {
  final ClassRepository _classRepository = ClassRepository();
  ClassBloc _classBloc;
  AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = BlocProvider.of<AuthBloc>(context);
    _classBloc = ClassBloc(classRepository: _classRepository);
    _classBloc.dispatch(Fetch());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _classBloc,
      builder: (BuildContext context, ClassState state) {
        if (state is ClassUninitialized) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ClassLoaded) {
          if (state.attendees.isEmpty) {
            return Center(
              child: Text('no attendees'),
            );
          }
          return Scaffold(
              appBar: AppBar(
                title: Text("Registry"),
              ),
              body: Center(
                  child: Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            //@TODO: needs a component to render a list here
                            AttendeeWidget(attendee: state.attendees[0]),
                            RaisedButton(
                              child: Text('Accept all'),
                              onPressed: () {
                                _classBloc.dispatch(Clear());
                              },
                            ),
                            RaisedButton(
                              child: Text('logout'),
                              onPressed: () {
                                _authBloc.dispatch(LogOut());
                              },
                            )
                  ])
                  )
              )
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _classBloc.dispose();
    super.dispose();
  }
}

class AttendeeWidget extends StatelessWidget {
  final String attendee;

  const AttendeeWidget({Key key, @required this.attendee}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(attendee),
    );
  }
}
