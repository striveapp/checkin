import 'package:checkin/src/blocs/login/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestLoginButtons extends StatelessWidget {
  const TestLoginButtons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: <Widget>[
        SizedBox(
          height: 20,
        ),
        RaisedButton(
          key: Key('backdoorButton'),
          onPressed: () => context.read<LoginBloc>().add(LoginWithTestUser()),
          child: Text('Test'),
        ),
        SizedBox(height: 10),
        RaisedButton(
          key: Key('backdoorButtonTwo'),
          onPressed: () =>
              context.read<LoginBloc>().add(LoginWithTestUserTwo()),
          child: Text('Test 2'),
        ),
        SizedBox(height: 10),
        RaisedButton(
          key: Key('backdoorAdminButton'),
          onPressed: () =>
              context.read<LoginBloc>().add(LoginWithTestUserAdmin()),
          child: Text('Test Admin'),
        ),
        SizedBox(height: 10),
        RaisedButton(
          key: Key('backdoorMasterButton'),
          onPressed: () =>
              context.read<LoginBloc>().add(LoginWithTestUserMaster()),
          child: Text('Test Master'),
        ),
      ],
    );
  }
}
