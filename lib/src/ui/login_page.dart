import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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

class _LoginState extends State<Login> {
  AuthBloc _authBloc;

  _LoginState() {
    _authBloc = AuthBloc(
        googleSignIn: GoogleSignIn(),
        auth: FirebaseAuth.instance
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: _authBloc,
      builder: (BuildContext context, AuthState state) {
        if (state is AuthUninitialized) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Login Page"),
            ),
            body: Center(
              child: RaisedButton(
                  child: Text('Sign in with Big G'),
                  onPressed: () {
                    _authBloc.dispatch(SignIn());
                  }),
            ),
          );
        }

        if (state is AuthSuccess) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Login Page"),
            ),
            body: Center(
                child: Text('Welcome ' + state.user.email)
            ),
          );
        }

        if (state is AuthError) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Login Page"),
            ),
            body: Center(
                child: Text('Bad Things, such as: ' + state.error.toString())
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    _authBloc.dispose();
    super.dispose();
  }
}
