import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/ui/components/class_counter.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:checkin/src/ui/components/user_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({
    Key key,
  }) : super(key: key);

  @override
  _ProfileState createState() {
    return _ProfileState();
  }
}

_getColor(String grade) {
  switch (grade) {
    case 'White':
      return Colors.white;
    case 'Blue':
      return Colors.blueAccent;
    case 'Purple':
      return Colors.purple;
    case 'Brown':
      return Colors.brown;
    case 'Black':
      return Colors.black87;
  }
}

class _ProfileState extends State<ProfilePage> {
  bool _isEditing;

  @override
  void initState() {
    _isEditing = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // todo initializing userBloc in initState() breaks appbar
    var _userBloc = BlocProvider.of<UserBloc>(context);

    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: ((_userBloc.currentState as UserSuccess).currentUser.rank ==
                    'White')
                ? Colors.black
                : Colors.white,
          ),
          backgroundColor: _getColor(
              (_userBloc.currentState as UserSuccess).currentUser.rank),
          title: Text(Localization.of(context).profile,
              style: TextStyle(
                  fontSize: 24,
                  letterSpacing: 0.8,
                  fontFamily: "Roboto",
                  color: ((_userBloc.currentState as UserSuccess)
                              .currentUser
                              .rank ==
                          'White')
                      ? Colors.black
                      : Colors.white,
                  fontWeight: FontWeight.w600)),
          centerTitle: true,
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                key: Key('editProfileButton'),
                onPressed: () {
                  //TODO: this should be handled by UserBloc?
                  setState(() {
                    _isEditing = true;
                  });
                },
                icon: Icon(Icons.edit),
              ),
            ),
          ],
        ),
        body: BlocBuilder(
          bloc: _userBloc,
          builder: (BuildContext context, UserState state) {
            if (state is UserLoading) {
              return LoadingIndicator();
            }
            if (state is UserSuccess) {
              return Center(
                  child: Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: UserImage(userImage: state.currentUser.imageUrl),
                    ),
                    if (!_isEditing)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          state.currentUser.name,
                          style: TextStyle(
                              fontSize: 20,
                              letterSpacing: 0.8,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    if (_isEditing)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
                        child: TextField(
                          onSubmitted: (name) {
                            setState(() {
                              _isEditing = false;
                            });
                            if(name.length > 3) {
                              _userBloc.dispatch(UpdateName(name: name));
                            }
                          },
                          autocorrect: false,
                          textAlign: TextAlign.center,
                          maxLength: 30,
                          autofocus: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: Localization.of(context).nameHint),
                          style: TextStyle(
                              fontSize: 20,
                              letterSpacing: 0.8,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w400),
                          controller: TextEditingController.fromValue(
                              TextEditingValue(
                                  text: state.currentUser.name,
                                  selection: new TextSelection.collapsed(
                                      offset:
                                          state.currentUser.name.length))),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50),
                      child: ClassCounter(counter: state.currentUser.counter),
                    )
                  ])));
            }
            return ErrorWidget('Unknown State received in: profile_page');
          },
        ));
  }

  @override
  void dispose() {
    super.dispose();
  }
}
