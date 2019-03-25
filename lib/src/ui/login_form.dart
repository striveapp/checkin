import 'package:checkin/src/blocs/login/bloc.dart';
import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/ui/google_sign_in_button.dart';
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
                content: Text('${state.error}'),
                backgroundColor: Colors.red,
              ),
            );
          });
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: new EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 40.0),
              child: Image.asset(
                "assets/images/logo.png",
                width: 250.0,
              ),
            ),
            GoogleSignInButton(
              onPressed: state is! LoginLoading
                  ? _onLoginWithGoogleButtonPressed
                  : null,
              darkMode: true,
              borderRadius: 50.0,
            ),
            Container(
              child: state is LoginLoading ? CircularProgressIndicator() : null,
            ),
          ],
        );
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
}
