import 'package:checkin/src/blocs/login/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InsertEmailView extends StatefulWidget {
  static const String insetEmailPlaceholder = "Your email address";
  static const String next = "Next";
  static const String invalidEmail = "Sorry, but that email is invalid.";
  static const String sendEmailExplanation =
      "We'll send you an email that'll instantly sign you in";

  @override
  _InsertEmailViewState createState() => _InsertEmailViewState();
}

class _InsertEmailViewState extends State<InsertEmailView> {
  static const Pattern EMAIL_REGEX =
      r"^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;
  String _userEmail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Form(
                  key: _formKey,
                  autovalidateMode: _autoValidateMode,
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    cursorColor: Theme.of(context).accentColor,
                    style: Theme.of(context).textTheme.headline1,
                    decoration: new InputDecoration(
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
                      labelText: InsertEmailView.insetEmailPlaceholder.i18n,
                      labelStyle: Theme.of(context).textTheme.headline1,
                    ),
                    validator: _validateEmail,
                    onSaved: (String value) {
                      _userEmail = value;
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  InsertEmailView.sendEmailExplanation.i18n,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              child: Text(
                InsertEmailView.next.i18n.toUpperCase(),
                style: Theme.of(context).textTheme.button,
              ),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  LoginBloc loginBloc = context.read<LoginBloc>();
                  loginBloc.add(LoginPasswordless(userEmail: _userEmail));
                  Navigator.of(context).pushNamed("email-retrieve/$_userEmail");
                } else {
                  setState(() {
                    _autoValidateMode = AutovalidateMode.onUserInteraction;
                  });
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  String _validateEmail(String value) {
    RegExp regex = new RegExp(EMAIL_REGEX);
    if (!regex.hasMatch(value))
      return InsertEmailView.invalidEmail.i18n;
    else
      return null;
  }
}
