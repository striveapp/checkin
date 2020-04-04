import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:checkin/src/ui/components/user_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCard extends StatelessWidget {
  final String userEmail;
  static const String enterYourName = 'Enter your name';

  ProfileCard({
    @required this.userEmail,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: BlocBuilder<ProfileBloc, ProfileState>(
            builder: (BuildContext context, ProfileState state) {
          if (state is ProfileLoading) {
            return LoadingIndicator();
          }

          if (state is ProfileSuccess) {
            return Row(
              children: <Widget>[
                UserImage(userImage: state.profileUser.imageUrl),
                SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: TextField(
                    key: Key("editProfileButton"),
                    onSubmitted: (name) {
                      if (name.length > 3) {
                        BlocProvider.of<UserBloc>(context).add(UpdateName(newName: name));
                      }
                    },
                    autocorrect: false,
                    maxLength: 30,
                    autofocus: false,
                    style: Theme.of(context).textTheme.headline3,
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.edit),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        counter: SizedBox.shrink(),
                        hintText: enterYourName.i18n),
                    controller: TextEditingController.fromValue(TextEditingValue(
                        text: state.profileUser.name,
                        selection: new TextSelection.collapsed(
                            offset: state.profileUser.name.length))),
                  ),
                ),
              ],
            );
          }

          return ErrorWidget('Unknown state [$state] for profile_card');
        }),
      ),
    );
  }

}
