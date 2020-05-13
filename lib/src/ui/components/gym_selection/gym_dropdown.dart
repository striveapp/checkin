import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/constants.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GymDropdown extends StatelessWidget {
  final String userEmail;

  GymDropdown({
    this.userEmail
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      hint: Text("Choose your gym..."),
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newSelectedGym) {
        BlocProvider.of<UserBloc>(context)
            .add(UpdateSelectedGym(userEmail: userEmail, newSelectedGym: newSelectedGym));
      },
      items: <String>[aranha_gym, gullo_gym]
          .map<DropdownMenuItem<String>>(
              (String value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(value.i18n),
                  ))
          .toList(),
    );
  }
}
