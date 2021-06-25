import 'package:checkin/src/blocs/auth/auth_bloc.dart';
import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/ui/components/cancel_button.dart';
import 'package:checkin/src/ui/components/editable_image.dart';
import 'package:checkin/src/ui/components/empty_widget.dart';
import 'package:checkin/src/util/string_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditableProfilePage extends StatelessWidget {
  static const String profile = 'Profile';
  static const String beltColor = '%s Belt';
  static const String enterYourName = 'Enter your name';
  static const String thisDoesNotLookLikeAValidName = "This does not look like a valid name";

  const EditableProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return state.map(
          initialProfileState: (_) => EmptyWidget(),
          profileLoaded: (ProfileLoaded state) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerRight,
                  child: OutlinedButton(
                    onPressed: () {},
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
                              .apply(color: Theme.of(context).accentColor, fontSizeFactor: 0.80),
                        ),
                        Icon(
                          Icons.keyboard_arrow_right_outlined,
                          color: Theme.of(context).accentColor,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                EditableImage(
                  imageUrl: state.profileUser.imageUrl,
                  onEdit: () {},
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
                      TextFormField(
                        key: Key("editName"),
                        keyboardType: TextInputType.name,
                        cursorColor: Theme.of(context).accentColor,
                        style: Theme.of(context).textTheme.headline3,
                        decoration: new InputDecoration(
                          errorBorder: InputBorder.none,
                          errorMaxLines: 2,
                          errorStyle: Theme.of(context)
                              .textTheme
                              .bodyText1
                              .apply(color: Theme.of(context).errorColor),
                          disabledBorder: InputBorder.none,
                          labelText: "Your name".i18n,
                          labelStyle: Theme.of(context).textTheme.headline1,
                        ),
                        controller: TextEditingController.fromValue(
                          TextEditingValue(
                              text: state.profileUser.name,
                              selection: new TextSelection.collapsed(
                                  offset: state.profileUser.name.length)),
                        ),
                        validator: _validateName,
                        onFieldSubmitted: (String value) {
                          if (_formKey.currentState.validate()) {
                            context.read<ProfileBloc>().add(UpdateName(
                                  userEmail: state.profileUser.email,
                                  newName: value.trim(),
                                ));
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
        );
      },
    );
  }

  String _validateName(String value) {
    if (value == null || value.isBlank)
      return thisDoesNotLookLikeAValidName.i18n;
    else
      return null;
  }
}
