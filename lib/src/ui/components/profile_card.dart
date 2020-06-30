import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/ui/components/add_photo_badge.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:checkin/src/ui/components/user_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCard extends StatelessWidget {
  final String userEmail;
  final bool isOwner;
  static const String enterYourName = 'Enter your name';

  ProfileCard({
    @required this.userEmail,
    @required this.isOwner,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
                //TODO: this is disabled temporarily for the owner to prevent other bugs to happen [https://trello.com/c/AsSz0amj]
                if (isOwner) UserImage(userImage: state.profileUser.imageUrl),
                if (!isOwner)
                  GestureDetector(
                    child: Stack(
                      alignment: AlignmentDirectional.bottomEnd,
                      overflow: Overflow.visible,
                      children: [
                        UserImage(
                            userImage: state.profileUser.imageUrl),
                        Positioned(
                            right: -8,
                            bottom: -2,
                            child: AddPhotoBadge())
                      ],
                    ),
                    onTap: () {
                      BlocProvider.of<UserBloc>(context).add(
                          UserEvent.updateImageUrl(
                              userEmail: state.profileUser.email));
                    },
                  ),
                SizedBox(
                  width: 15,
                ),
                //TODO: this is disabled temporarily for the owner to prevent other bugs to happen [https://trello.com/c/AsSz0amj]
                if (isOwner)
                  Text(
                    state.profileUser.name,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                if (!isOwner)
                  Expanded(
                    child: TextField(
                      key: Key("editProfileButton"),
                      onSubmitted: (name) {
                        if (name.length > 3) {
                          BlocProvider.of<UserBloc>(context)
                              .add(UserEvent.updateName(newName: name));
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
                      controller: TextEditingController.fromValue(
                          TextEditingValue(
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
