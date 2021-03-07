import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/ui/components/editable_image.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:checkin/src/ui/components/rounded_image.dart';
import 'package:checkin/src/util/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCard extends StatelessWidget {
  static const String enterYourName = 'Enter your name';
  static const String thisDoesNotLookLikeAValidName = "This does not look like a valid name";

  final String userEmail;
  final bool isOwner;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
            builder: (BuildContext context, ProfileState state) => state.map(
                initialProfileState: (InitialProfileState _) => LoadingIndicator(),
                profileLoaded: (ProfileLoaded state) => Row(
                      children: <Widget>[
                        //TODO: this is disabled temporarily for the owner to prevent other bugs to happen [https://trello.com/c/AsSz0amj]
                        if (isOwner) RoundedImage(userImage: state.profileUser.imageUrl),
                        if (!isOwner)
                          EditableImage(
                            imageUrl: state.profileUser.imageUrl,
                            onEdit: () {
                              context
                                  .read<ProfileBloc>()
                                  .add(UpdateImageUrl(userEmail: state.profileUser.email));
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
                            child: Form(
                              key: _formKey,
                              autovalidateMode: AutovalidateMode.onUserInteraction,
                              child: TextFormField(
                                key: Key("editProfileButton"),
                                keyboardType: TextInputType.name,
                                cursorColor: Theme.of(context).accentColor,
                                style: Theme.of(context).textTheme.headline2,
                                decoration: new InputDecoration(
                                  hintText: enterYourName.i18n,
                                  hintStyle: Theme.of(context).textTheme.headline3,
                                  border: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: InputBorder.none,
                                  errorBorder: InputBorder.none,
                                  errorMaxLines: 2,
                                  errorStyle: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .apply(color: Theme.of(context).errorColor),
                                  disabledBorder: InputBorder.none,
                                ),
                                controller: TextEditingController.fromValue(TextEditingValue(
                                    text: state.profileUser.name,
                                    selection: new TextSelection.collapsed(
                                        offset: state.profileUser.name.length))),
                                validator: _validateName,
                                onFieldSubmitted: (String value) {
                                  if (_formKey.currentState.validate()) {
                                    context
                                        .read<ProfileBloc>()
                                        .add(UpdateName(newName: value.trim()));
                                  }
                                },
                              ),
                            ),
                          )
                      ],
                    ))),
      ),
    );
  }

  String _validateName(String value) {
    if (value == null || value.isBlank)
      return thisDoesNotLookLikeAValidName.i18n;
    else
      return null;
  }
}
