// @dart=2.9

import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/ui/components/basic_text_field.dart';
import 'package:checkin/src/ui/components/cancel_button.dart';
import 'package:checkin/src/ui/components/date_time_field.dart';
import 'package:checkin/src/ui/components/editable_image.dart';
import 'package:checkin/src/ui/components/placeholder_image.dart';
import 'package:checkin/src/ui/components/placeholder_text.dart';
import 'package:checkin/src/util/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditableProfilePage extends StatelessWidget {
  static const String profile = 'Profile';
  static const String beltColor = '%s belt';

  static const String insertYourName = 'Insert your name';
  static const String name = 'Name';
  static const String thisDoesNotLookLikeAValidName = 'This does not look like a valid name';
  static const String thisDoesNotLookLikeAValidWeight = 'This does not look like a valid weight';

  static const String weight = 'Weight (kg)';
  static const String insertYourWeight = 'Insert your weight';

  static const String birthday = 'Birthday';
  static const String insertYourBirthday = 'Insert your birthday';

  final PageController pageController;

  const EditableProfilePage({Key key, PageController this.pageController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return state.map(
          initialProfileState: (_) => PlaceholderProfile(),
          profileLoaded: (ProfileLoaded state) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: GoToMembership(pageController: pageController),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  EditableImage(
                    imageUrl: state.profileUser.imageUrl,
                    onEdit: () {
                      context.read<ProfileBloc>().add(ProfileEvent.updateImageUrl(
                            userEmail: state.profileUser.email,
                          ));
                    },
                    size: 100,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 25,
                        height: 25,
                        child: state.profileUser.grade.icon,
                      ),
                      SizedBox(
                        width: 7.5,
                      ),
                      Text(
                        beltColor.i18n.fill([state.profileUser.grade.name.i18n]),
                        style: Theme.of(context).textTheme.headline4.apply(
                              color: state.profileUser.grade.color,
                              fontWeightDelta: 2,
                            ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: _formKey,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Column(
                      children: [
                        BasicTextField(
                          key: Key("editName"),
                          labelText: name.i18n,
                          hintText: insertYourName.i18n,
                          textValue: state.profileUser.name,
                          validator: _validateName,
                          keyboardType: TextInputType.name,
                          onFieldSubmitted: (String value) {
                            if (_formKey.currentState.validate()) {
                              context.read<ProfileBloc>().add(UpdateName(
                                    userEmail: state.profileUser.email,
                                    newName: value.trim(),
                                  ));
                            }
                          },
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        BasicTextField(
                          key: Key("editWeight"),
                          labelText: weight.i18n,
                          hintText: insertYourWeight.i18n,
                          textValue: state.profileUser.weight.toString(),
                          validator: _validateWeight,
                          keyboardType: TextInputType.number,
                          onFieldSubmitted: (String value) {
                            if (_formKey.currentState.validate()) {
                              context.read<ProfileBloc>().add(UpdateWeight(
                                    userEmail: state.profileUser.email,
                                    newWeight: double.parse(value),
                                  ));
                            }
                          },
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        DateTimeField(
                          key: Key("editBirthday"),
                          labelText: birthday.i18n,
                          hintText: insertYourBirthday.i18n,
                          firstDate: DateTime.now(),
                          initialDate: null,
                          lastDate: DateTime.now().add(new Duration(days: 30)),
                          onFieldSubmitted: (DateTime value) {
                            if (_formKey.currentState.validate()) {
                              // todo
                              // context.read<ProfileBloc>().add(UpdateName(
                              //   userEmail: state.profileUser.email,
                              //   newName: MaterialLocalizations.of(context).formatCompactDate(value),
                              // ));
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  if (state.profileUser.selectedGymId == "test")
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 20.0),
                          child: CancelButton(
                            key: Key('logoutButton'),
                            text: "Logout",
                            onPressed: () {
                              Navigator.popUntil(
                                context,
                                ModalRoute.withName(Navigator.defaultRouteName),
                              );
                              BlocProvider.of<AuthBloc>(context).add(LogOut());
                            },
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  String _validateName(String value) {
    if (value == null || value.isBlank) {
      return thisDoesNotLookLikeAValidName.i18n;
    }
    return null;
  }

  String _validateWeight(String value) {
    var intValue = double.tryParse(value);
    if (intValue == null || (intValue <= 0 || intValue >= 500)) {
      return thisDoesNotLookLikeAValidWeight.i18n;
    }
    return null;
  }
}

class PlaceholderProfile extends StatelessWidget {
  const PlaceholderProfile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
      child: Column(
        children: [
          PlaceholderImage(width: 100, height: 100),
          SizedBox(
            height: 20,
          ),
          PlaceholderText(fontHeight: 16, width: 60),
          SizedBox(
            height: 50,
          ),
          Column(
            children: [
              PlaceholderText(fontHeight: 20, width: MediaQuery.of(context).size.width / 2),
              SizedBox(
                height: 25,
              ),
              PlaceholderText(fontHeight: 20, width: MediaQuery.of(context).size.width / 2),
              SizedBox(
                height: 25,
              ),
              PlaceholderText(fontHeight: 20, width: MediaQuery.of(context).size.width / 2),
              SizedBox(
                height: 25,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class GoToMembership extends StatelessWidget {
  const GoToMembership({
    Key key,
    @required this.pageController,
  }) : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () {
        pageController.animateToPage(1, curve: Curves.ease, duration: Duration(milliseconds: 500));
      },
      style: OutlinedButton.styleFrom(padding: EdgeInsets.only(left: 10)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Membership".i18n,
            style: Theme.of(context)
                .textTheme
                .button
                .apply(color: Theme.of(context).colorScheme.secondary, fontSizeFactor: 0.80),
          ),
          Icon(
            Icons.keyboard_arrow_right_outlined,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ],
      ),
    );
  }
}
