import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/resources/user_repository.dart';
import 'package:checkin/src/ui/components/class_counter.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:checkin/src/ui/components/user_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePage extends StatefulWidget {
  final String email;

  ProfilePage({
    Key key,
    @required this.email,
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
  ProfileBloc _profileBloc;

  @override
  void initState() {
    _isEditing = false;
    _profileBloc = ProfileBloc(userRepository: UserRepository(), profileEmail: widget.email);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // todo initializing userBloc in initState() breaks appbar
    var _userBloc = BlocProvider.of<UserBloc>(context);

    return BlocBuilder(
        bloc: _profileBloc,
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
            var editAction = <Widget>[];

            if( profileUser.email == (_userBloc.currentState as UserSuccess).currentUser.email ) {
              editAction.add(Padding(
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
              ));
            }

            return Scaffold(
                resizeToAvoidBottomPadding: false,
                appBar: AppBar(
                  iconTheme: IconThemeData(
                    color: profileUser.rank == 'White'
                        ? Colors.black
                        : Colors.white,
                  ),
                  backgroundColor: _getColor(profileUser.rank),
                  title: Text(Localization.of(context).profile,
                      style: TextStyle(
                          fontSize: 24,
                          letterSpacing: 0.8,
                          fontFamily: "Roboto",
                          color: profileUser.rank == 'White'
                              ? Colors.black
                              : Colors.white,
                          fontWeight: FontWeight.w600)),
                  centerTitle: true,
                  actions: editAction,
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
                                    text: profileUser.name,
                                    selection: new TextSelection.collapsed(
                                        offset: profileUser.name.length))),
                          ),
                        ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 50),
                        child: ClassCounter(counter: profileUser.counter),
                      )
                    ]))));
          }
          return ErrorWidget('Unknown State received in: profile_page');
        });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
