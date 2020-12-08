import 'package:checkin/src/blocs/login/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/ui/components/login/apple_sign_in_button.dart';
import 'package:checkin/src/ui/components/login/google_sign_in_button.dart';
import 'package:checkin/src/ui/components/login/passwordless_sign_in_button.dart';
import 'package:checkin/src/util/debug_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:platform/platform.dart';

class LoginForm extends StatefulWidget {
  static const String or = 'or';

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  LoginBloc _loginBloc;

  @override
  void initState() {
    super.initState();
    _loginBloc = BlocProvider.of<LoginBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(
                  state.errorMessage.i18n,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                backgroundColor: Theme.of(context).accentColor.withAlpha(150),
                duration: Duration(seconds: 10),
              ),
            );
        }
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
                  "assets/images/logo-big.png",
                  width: 200.0,
                ),
              ),
              GoogleSignInButton(
                key: Key('loginButton'),
                onPressed: state is! LoginLoading ? _onLoginWithGoogleButtonPressed : null,
                darkMode: true,
                borderRadius: 50.0,
              ),
              if (LocalPlatform().isIOS)
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    AppleSignInButton(),
                  ],
                ),
              SizedBox(
                height: 20,
              ),
              Text(
                LoginForm.or.i18n,
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: PasswordlessSignInButton(),
              ),
              if (isInDebugMode)
                Column(
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      key: Key('backdoorButton'),
                      onPressed: _onLoginWithTestUser,
                      child: Text('Test'),
                    ),
                    SizedBox(height: 10),
                    RaisedButton(
                      key: Key('backdoorButtonTwo'),
                      onPressed: _onLoginWithTestUserTwo,
                      child: Text('Test 2'),
                    ),
                    SizedBox(height: 10),
                    RaisedButton(
                      key: Key('backdoorAdminButton'),
                      onPressed: _onLoginWithTestUserAdmin,
                      child: Text('Test Admin'),
                    ),
                    SizedBox(height: 10),
                    RaisedButton(
                      key: Key('backdoorMasterButton'),
                      onPressed: _onLoginWithTestUserMaster,
                      child: Text('Test Master'),
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

  _onLoginWithTestUserAdmin() {
    _loginBloc.add(LoginWithTestUserAdmin());
  }

  _onLoginWithTestUserMaster() {
    _loginBloc.add(LoginWithTestUserMaster());
  }
}
