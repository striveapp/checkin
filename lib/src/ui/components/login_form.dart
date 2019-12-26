import 'package:checkin/src/blocs/login/bloc.dart';
import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/ui/components/google_sign_in_button.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:checkin/src/util/debug_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  AuthBloc _authBloc;
  LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _authBloc = BlocProvider.of<AuthBloc>(context);
    _loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          Scaffold.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content:
                    Text(Localization.of(context).getValue(state.errorMessage)),
                backgroundColor: Colors.red,
              ),
            );
        }

        if (state is LoginSuccess) {
          _authBloc.add(LoggedIn(currentUser: state.loggedUser));
        }

        return LoadingIndicator();
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (
          BuildContext context,
          LoginState state,
        ) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: new EdgeInsets.symmetric(vertical: 50),
                child: Image.asset(
                  "assets/images/logo.png",
                  width: 150.0,
                ),
              ),
              GoogleSignInButton(
                key: Key('loginButton'),
                onPressed: state is! LoginLoading
                    ? _onLoginWithGoogleButtonPressed
                    : null,
                darkMode: true,
                borderRadius: 50.0,
              ),
              if (isInDebugMode)
                Column(
                  children: <Widget>[
                    RaisedButton(
                      key: Key('backdoorButton'),
                      onPressed: _onLoginWithTestUser,
                      child: Text('Test'),
                    ),
                    RaisedButton(
                      key: Key('backdoorButtonTwo'),
                      onPressed: _onLoginWithTestUserTwo,
                      child: Text('Test 2'),
                    ),
                    RaisedButton(
                      key: Key('backdoorAdminButton'),
                      onPressed: _onLoginWithTestUserOwner,
                      child: Text('Test Owner'),
                    ),
                  ],
                )
            ],
          );
        },
      ),
    );
  }

  _onLoginWithGoogleButtonPressed() {
    _loginBloc.add(LoginWithGoogle());
  }

  _onLoginWithTestUser() {
    _loginBloc.add(LoginWithTestUser());
  }

  _onLoginWithTestUserTwo() {
    _loginBloc.add(LoginWithTestUserTwo());
  }

  _onLoginWithTestUserOwner() {
    _loginBloc.add(LoginWithTestUserOwner());
  }
}
