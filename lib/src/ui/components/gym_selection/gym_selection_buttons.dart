import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GymSelectionButtons extends StatelessWidget {
  static const String aranhaGym = "Asociación Aranha Barcelona";
  static const String gulloGym = "Gullo Jiu-Jitsu Barcelona";

  final String userEmail;
  final availableGyms = <Map<String, String>>[
    {
      "id": aranha_gym,
      "name": aranhaGym,
    },
    {
      "id": gullo_gym,
      "name": gulloGym,
    },
  ];

  GymSelectionButtons({this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: availableGyms
          .map<Widget>((Map<String, String> gym) => Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Theme.of(context).accentColor,
                    child: Text(gym["name"],
                        style: Theme.of(context).textTheme.button),
                    onPressed: () {
                      BlocProvider.of<UserBloc>(context).add(UpdateSelectedGym(
                          userEmail: userEmail, newSelectedGym: gym["id"]));
                    },
                  ),
                ),
              ))
          .toList(),
    );
  }
}
