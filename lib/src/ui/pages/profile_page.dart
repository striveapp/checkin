import 'package:checkin/src/blocs/auth/auth_bloc.dart';
import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/resources/user_repository.dart';
import 'package:checkin/src/ui/components/base_app_bar.dart';
import 'package:checkin/src/ui/components/class_counter.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:checkin/src/ui/components/user_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../util.dart';

//TODO: this should be a StatelessWidget
class ProfilePage extends StatefulWidget {
  final String _email;
  final UserRepository _userRepository;

  ProfilePage({
    Key key,
    @required String email,
    @required UserRepository userRepository,
  })  : assert(email != null && userRepository != null),
        _userRepository = userRepository,
        _email = email,
        super(key: key);

  @override
  _ProfileState createState() {
    return _ProfileState();
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
    return BlocProvider<ProfileBloc>(
      create: (BuildContext context) => ProfileBloc(
        userBloc: BlocProvider.of<UserBloc>(context),
        userRepository: widget._userRepository,
        profileEmail: widget._email,
      ),
      child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (BuildContext context, ProfileState state) {
        if (state is ProfileLoading) {
          return Scaffold(body: LoadingIndicator());
        }

        if (state is ProfileError) {
          return Scaffold(
            body: ErrorWidget("Error while loading profile"),
          );
        }

        if (state is ProfileSuccess) {
          final User profileUser = state.profileUser;
          var appBarActions = <Widget>[];

          if (state.isCurrentUser) {
            appBarActions.add(Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: IconButton(
                key: Key('editProfileButton'),
                onPressed: () {
                  //TODO: this should be handled by ProfileBloc
                  setState(() {
                    _isEditing = true;
                  });
                },
                icon: Icon(Icons.edit),
              ),
            ));
          }

          return Scaffold(
              resizeToAvoidBottomPadding: false,
              appBar: BaseAppBar(
                title: Localization.of(context).profile,
                backgroundColor: _getAppBarColor(profileUser.rank),
                actions: appBarActions,
                showUserImage: false,
              ),
              body: Center(
                  child: Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: UserImage(userImage: profileUser.imageUrl),
                    ),
                    if (!_isEditing)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(
                          profileUser.name,
                          style: TextStyle(
                              fontSize: 20,
                              letterSpacing: 0.8,
                              fontFamily: "Roboto",
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    if (_isEditing)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 20.0),
                        child: TextField(
                          onSubmitted: (name) {
                            setState(() {
                              _isEditing = false;
                            });
                            if (name.length > 3) {
                              BlocProvider.of<UserBloc>(context)
                                  .add(UpdateName(newName: name));
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
                                  text: profileUser.name,
                                  selection: new TextSelection.collapsed(
                                      offset: profileUser.name.length))),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50),
                      child: ClassCounter(counter: profileUser.counter),
                    ),
                    if (isInDebugMode && state.isCurrentUser)
                      RaisedButton(
                        key: Key('logoutButton'),
                        color: Colors.red,
                        child: Text(Localization.of(context).logout,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontWeight: FontWeight.w600)),
                        onPressed: () {
                          Navigator.popUntil(
                            context,
                            ModalRoute.withName(Navigator.defaultRouteName),
                          );
                          BlocProvider.of<AuthBloc>(context).add(LogOut());
                        },
                      ),
                  ]))));
        }
        return ErrorWidget('Unknown State [$state] received in: profile_page');
      }),
    );
  }
}

_getAppBarColor(String grade) {
  switch (grade) {
    case 'White':
      return Colors.white10;
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
