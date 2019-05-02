import 'package:checkin/src/blocs/auth/auth_bloc.dart';
import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/blocs/class/bloc.dart';
import 'package:checkin/src/resources/class_repository.dart';
import 'package:checkin/src/resources/user_repository.dart';
import 'package:checkin/src/ui/attendees_list.dart';
import 'package:checkin/src/ui/loading_indicator.dart';
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
  final UserRepository _userRepository = UserRepository();
  ClassBloc _classBloc;
  AuthBloc _authBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = BlocProvider.of<AuthBloc>(context);
    _classBloc = ClassBloc(
        classRepository: _classRepository, userRepository: _userRepository);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registry",
            style: TextStyle(
                fontSize: 24,
                letterSpacing: 0.8,
                fontFamily: "Roboto",
                color: Colors.white,
                fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: BlocBuilder(
        bloc: _classBloc,
        builder: (BuildContext context, ClassState state) {
          if (state is ClassUninitialized) {
            return LoadingIndicator();
          }
          if (state is ClassLoaded) {
            return Center(
                child: Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: AttendeesList(attendeeList: state.attendees),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: RaisedButton(
                      color: Colors.indigo,
                      child: Text('Accept all',
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Roboto",
                              color: Colors.white,
                              fontWeight: FontWeight.w600)),
                      onPressed: () {
                        _classBloc
                            .dispatch(Confirm(attendees: state.attendees));
                      },
                    ),
                  ),
                  RaisedButton(
                    color: Colors.red,
                    child: Text('Logout',
                        style: TextStyle(
                            fontSize: 18,
                            fontFamily: "Roboto",
                            color: Colors.white,
                            fontWeight: FontWeight.w600)),
                    onPressed: () {
                      _authBloc.dispatch(LogOut());
                    },
                  )
                ])));
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _classBloc.dispose();
    super.dispose();
  }
}
