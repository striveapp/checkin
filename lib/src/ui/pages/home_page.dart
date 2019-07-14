import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'lessons_page.dart';

// todo la home page dovrebbe avere l'appbar adesso è copypastata in giro
class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  UserBloc _userBloc;

  @override
  void initState() {
    _userBloc = BlocProvider.of<UserBloc>(context);
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
            debugPrint('Home page loaded with user ' + state.currentUser.toString());
            return LessonsPage(userBloc: _userBloc,);
          }

          return ErrorWidget('Unknown State received in: home_page');
        })
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
