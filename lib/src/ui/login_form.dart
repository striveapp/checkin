import 'package:checkin/src/blocs/login/bloc.dart';
import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/ui/google_sign_in_button.dart';
import 'package:checkin/src/ui/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  final LoginBloc loginBloc;
  final AuthBloc authBloc;

  LoginForm({
    Key key,
    @required this.loginBloc,
    @required this.authBloc,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  LoginBloc get _loginBloc => widget.loginBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginEvent, LoginState>(
      bloc: _loginBloc,
      builder: (
        BuildContext context,
        LoginState state,
      ) {
        if (state is LoginFailure) {
          _onWidgetDidBuild(() {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text(Localization.of(context).getValue(state.errorMessage)),
                backgroundColor: Colors.red,
              ),
            );
          });
        }

        if (state is LoginLoading) {
          return LoadingIndicator();
        }

        if( state is LoginInitial) {
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
              Opacity(opacity: 0.0, child: Container(width: 1, height: 1,child: RaisedButton(key: Key('backdoorButton'),onPressed: _onLoginWithTestUser, child: Text(''),))),
              Opacity(opacity: 0.0, child: Container(width: 1, height: 1,child: RaisedButton(key: Key('backdoorAdminButton'),onPressed: _onLoginWithTestUserOwner, child: Text(''),))),
            ],
          );
        }

        return ErrorWidget('Unknown State received in: login_form');

      },
    );
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  _onLoginWithGoogleButtonPressed() {
    _loginBloc.dispatch(LoginWithGoogle());
  }

  _onLoginWithTestUser() {
    _loginBloc.dispatch(LoginWithTestUser());
  }

  _onLoginWithTestUserOwner() {
    _loginBloc.dispatch(LoginWithTestUserOwner());
  }
}
