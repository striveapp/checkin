import 'package:checkin/src/blocs/auth/auth_bloc.dart';
import 'package:checkin/src/blocs/auth/auth_event.dart';
import 'package:checkin/src/blocs/class/bloc.dart';
import 'package:checkin/src/resources/class_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StatusPage extends StatefulWidget {
  StatusPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _StatusState createState() {
    return _StatusState();
  }
}

class _StatusState extends State<StatusPage> {
  final ClassRepository _classRepository = ClassRepository();
  ClassBloc _classBloc;
  AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = BlocProvider.of<AuthBloc>(context);
    _classBloc = ClassBloc(classRepository: _classRepository);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Status"),
        ),
        body: BlocBuilder(
          bloc: _classBloc,
          builder: (BuildContext context, ClassState state) {
            return Center(
                child: Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                  RaisedButton(
                    child: Text('Attend'),
                    onPressed: () {
                      //@TODO: this should come from the state
                      _classBloc.dispatch(Attend(name: "pepe"));
                    },
                  ),
                  RaisedButton(
                    child: Text('logout'),
                    onPressed: () {
                      _authBloc.dispatch(LogOut());
                    },
                  ),
                ])));
          },
        ));
  }

  @override
  void dispose() {
    _classBloc.dispose();
    super.dispose();
  }
}
