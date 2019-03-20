import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/blocs/login/bloc.dart';
import 'package:checkin/src/ui/login_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _LoginPageState createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc _loginBloc;
  AuthBloc _authBloc;
  FirebaseAuth auth = FirebaseAuth.instance;

  _LoginPageState() {
    _authBloc = AuthBloc(
        auth: auth
    );
  }

  @override
  void initState() {
    _authBloc = BlocProvider.of<AuthBloc>(context);
    _loginBloc = LoginBloc(
      authenticationBloc: _authBloc,
      auth: auth,
      googleSignIn: GoogleSignIn(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: LoginForm(
        authBloc: _authBloc,
        loginBloc: _loginBloc,
      ),
    );
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }
}
