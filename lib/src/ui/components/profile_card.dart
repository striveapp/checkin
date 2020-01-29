import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/ui/components/user_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i18n_extension/default.i18n.dart';

class ProfileCard extends StatelessWidget {
  final User user;
  static const String enterYourName = 'Enter your name';

  ProfileCard({
    @required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.symmetric(
            vertical: 25, horizontal: 20),
        child: Row(
          children: <Widget>[
            UserImage(userImage: user.imageUrl),
            SizedBox(
              width: 15,
            ),
            Expanded(
              child: TextField(
                onSubmitted: (name) {
                  if (name.length > 3) {
                    BlocProvider.of<UserBloc>(context)
                        .add(UpdateName(newName: name));
                  }
                },
                autocorrect: false,
                maxLength: 30,
                autofocus: false,
                style: Theme.of(context).textTheme.subtitle,
                decoration: InputDecoration(
                    suffixIcon: Icon(Icons.edit),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    counter: SizedBox.shrink(),
                    hintText: enterYourName.i18n
                ),
                controller: TextEditingController.fromValue(
                    TextEditingValue(
                        text: user.name,
                        selection:
                        new TextSelection.collapsed(
                            offset: user.name.length))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
