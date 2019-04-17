import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/resources/user_repository.dart';
import 'package:checkin/src/ui/loading_indicator.dart';
import 'package:checkin/src/ui/registry_page.dart';
import 'package:checkin/src/ui/status_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  AuthBloc _authBloc;
  UserBloc _userBloc;
  UserRepository _userRepository;

  _HomePageState() {
    _userRepository = UserRepository();
  }

  @override
  void initState() {
    _authBloc = BlocProvider.of<AuthBloc>(context);
    _userRepository = UserRepository();
    _userBloc = UserBloc(authBloc: _authBloc, userRepository: _userRepository);
    _userBloc.dispatch(Load(email: (_authBloc.currentState as AuthAuthenticated).currentUserEmail ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  BlocBuilder(
        bloc: _userBloc,
        builder: (BuildContext context, UserState state) {
          if(state is UserLoading) {
            return LoadingIndicator();
          }

          if(state is UserSuccess) {
            return state.currentUser.isOwner ? RegistryPage() : StatusPage(userBloc: _userBloc,);
          }
        })
    );
  }

  @override
  void dispose() {
    _userBloc.dispose();
    super.dispose();
  }
}
