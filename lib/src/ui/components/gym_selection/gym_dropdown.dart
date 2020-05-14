import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/constants.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GymDropdown extends StatelessWidget {
  final String userEmail;

  static const String chooseGym = "Choose your gym...";

  GymDropdown({this.userEmail});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: Text(
        chooseGym.i18n,
        style:
            Theme.of(context).textTheme.headline3.apply(color: Colors.white38),
      ),
      icon: Icon(Icons.keyboard_arrow_down),
      iconSize: 28,
      elevation: 16,
      underline: Container(
        height: 2,
        color: Theme.of(context).accentColor,
      ),
      onChanged: (String newSelectedGym) {
        BlocProvider.of<UserBloc>(context).add(UpdateSelectedGym(
            userEmail: userEmail, newSelectedGym: newSelectedGym));
      },
      items: <String>[aranha_gym, gullo_gym]
          .map<DropdownMenuItem<String>>(
              (String value) => DropdownMenuItem<String>(
                  value: value,
                  child: Text(value.i18n,
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          .apply(fontSizeDelta: 3))))
          .toList(),
    );
  }
}
