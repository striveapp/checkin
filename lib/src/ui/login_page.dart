import 'package:checkin/src/blocs/login/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Login extends StatefulWidget {
  Login({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginState createState() {
    return _LoginState();
  }
}

class _LoginState extends State<Null> {

  GoogleSignIn _googleSignIn;
  FirebaseAuth _auth;
  LoginBloc _loginBloc;

  _LoginState() {
    GoogleSignIn _googleSignIn = GoogleSignIn();
    FirebaseAuth _auth = FirebaseAuth.instance;
    LoginBloc _loginBloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _loginBloc,
      builder: (BuildContext context, LoginState state) {
        return Text('test');
      },
    );
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }
}