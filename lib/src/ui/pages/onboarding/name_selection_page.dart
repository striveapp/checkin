// @dart=2.9

import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/util/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NameSelectionPage extends StatelessWidget {
  static const String welcomeToTheFamily = "Welcome to the family!";
  static const String couldYouTellUsHowPeopleKnowYou = "Could you tell us how people know you?";
  static const String insertYourName = "Insert your name";
  static const String whatsYourName = "What's your name?";
  static const String thisDoesNotLookLikeAValidName = "This does not look like a valid name";

  final String userEmail;

  NameSelectionPage({@required this.userEmail});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 100, horizontal: 30),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(NameSelectionPage.welcomeToTheFamily.i18n,
                    style: Theme.of(context).textTheme.headline1.apply(fontSizeDelta: 3)),
                SizedBox(height: 20),
                Expanded(
                  child: Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      cursorColor: Theme.of(context).colorScheme.secondary,
                      style: Theme.of(context).textTheme.headline1,
                      autofocus: true,
                      decoration: new InputDecoration(
                        hintText: insertYourName.i18n,
                        hintStyle: Theme.of(context).textTheme.headline2,
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        errorMaxLines: 2,
                        errorStyle: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .apply(color: Theme.of(context).colorScheme.error),
                        disabledBorder: InputBorder.none,
                        labelText: whatsYourName.i18n,
                        labelStyle: Theme.of(context).textTheme.headline3,
                      ),
                      validator: _validateName,
                      onFieldSubmitted: (String value) {
                        if (_formKey.currentState.validate()) {
                          context
                              .read<ProfileBloc>()
                              .add(UpdateName(userEmail: userEmail, newName: value.trim()));
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
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
