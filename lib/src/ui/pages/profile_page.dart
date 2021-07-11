// @dart=2.9

import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/ui/components/basic_text_field.dart';
import 'package:checkin/src/ui/components/cancel_button.dart';
import 'package:checkin/src/ui/components/date_time_field.dart';
import 'package:checkin/src/ui/components/editable_image.dart';
import 'package:checkin/src/ui/components/navigation_button.dart';
import 'package:checkin/src/ui/components/placeholder_image.dart';
import 'package:checkin/src/ui/components/placeholder_text.dart';
import 'package:checkin/src/util/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/* this page doesnt react to changes on the db */
class ProfilePage extends StatefulWidget {
  static const String profile = 'Profile';
  static const String beltColor = '%s belt';
  static const String membership = 'Membership';

  static const String insertYourName = 'Insert your name';
  static const String name = 'Name';
  static const String thisDoesNotLookLikeAValidName = 'This does not look like a valid name';
  static const String thisDoesNotLookLikeAValidWeight = 'This does not look like a valid weight';

  static const String weight = 'Weight (kg)';
  static const String insertYourWeight = 'Insert your weight';

  static const String birthday = 'Birthday';
  static const String insertYourBirthday = 'Insert your birthday';

  final PageController pageController;

  const ProfilePage({Key key, PageController this.pageController}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _nameFieldKey = GlobalKey<FormFieldState>();
  final _weightFieldKey = GlobalKey<FormFieldState>();
  final _birthdayFieldKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
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
                      child: NavigationButton(
                        text: ProfilePage.membership.i18n,
                        onPressed: () {
                          widget.pageController.animateToPage(1,
                              curve: Curves.ease, duration: Duration(milliseconds: 500));
                        },
                      ),
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
                        ProfilePage.beltColor.i18n.fill([state.profileUser.grade.name.i18n]),
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
                    child: Column(
                      children: [
                        BasicTextField(
                          key: Key("editName"),
                          textFieldKey: _nameFieldKey,
                          labelText: ProfilePage.name.i18n,
                          hintText: ProfilePage.insertYourName.i18n,
                          textValue: state.profileUser.name,
                          validator: _validateName,
                          keyboardType: TextInputType.name,
                          onFieldSubmitted: (String value) {
                            context.read<ProfileBloc>().add(UpdateName(
                                  userEmail: state.profileUser.email,
                                  newName: value.trim(),
                                ));
                          },
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        BasicTextField(
                          key: Key("editWeight"),
                          textFieldKey: _weightFieldKey,
                          labelText: ProfilePage.weight.i18n,
                          hintText: ProfilePage.insertYourWeight.i18n,
                          textValue: state.profileUser.weight != null
                              ? state.profileUser.weight.toString()
                              : null,
                          validator: _validateWeight,
                          keyboardType: TextInputType.number,
                          onFieldSubmitted: (String value) {
                            context.read<ProfileBloc>().add(UpdateWeight(
                                  userEmail: state.profileUser.email,
                                  newWeight: double.parse(value),
                                ));
                          },
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        DateTimeField(
                          key: Key("editBirthday"),
                          textFieldKey: _birthdayFieldKey,
                          labelText: ProfilePage.birthday.i18n,
                          hintText: ProfilePage.insertYourBirthday.i18n,
                          firstDate: DateTime.now(),
                          initialDate: state.profileUser.birthday,
                          lastDate: DateTime.now().add(new Duration(days: 30)),
                          onFieldSubmitted: (DateTime value) {
                            context.read<ProfileBloc>().add(UpdateBirthday(
                                  userEmail: state.profileUser.email,
                                  newBirthday: value,
                                ));
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
      return ProfilePage.thisDoesNotLookLikeAValidName.i18n;
    }
    return null;
  }

  String _validateWeight(String value) {
    var intValue = double.tryParse(value);
    if (intValue == null || (intValue <= 0 || intValue >= 500)) {
      return ProfilePage.thisDoesNotLookLikeAValidWeight.i18n;
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
