import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/ui/components/empty_widget.dart';
import 'package:checkin/src/ui/components/user_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileTile extends StatelessWidget {
  final String profileEmail;
  final int attendedClasses;
  final int position;
  static const String beltColor = '%s Belt';

  const ProfileTile({Key key, this.profileEmail, this.attendedClasses, this.position})
      : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<ProfileBloc, ProfileState>(
        cubit: ProfileBloc(
          userRepository: context.watch<UserRepository>(),
          userBloc: context.watch<UserBloc>(),
          nonCurrentUserEmail: profileEmail,
        )..add(InitializeProfile()),
        builder: (BuildContext context, ProfileState state) => state.map(
          initialProfileState: (InitialProfileState _) => EmptyWidget(),
          profileLoaded: (ProfileLoaded state) => Padding(
            padding: EdgeInsets.symmetric(vertical: 3),
            child: Column(
              children: <Widget>[
                ListTile(
                  onTap: () {
                    Navigator.of(context).pushNamed('stats/${state.profileUser.email}');
                  },
                  leading: Text(
                    _getOrdinal(position),
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  title: Row(
                    children: <Widget>[
                      UserImage(
                        userImage: state.profileUser.imageUrl,
                        width: 40,
                        height: 40,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            state.profileUser.name,
                            style: Theme.of(context).textTheme.bodyText1.apply(fontWeightDelta: 2),
                          ),
                          SizedBox(
                            height: 2.5,
                          ),
                          Text(
                            beltColor.i18n.fill([state.profileUser.grade.name.i18n]),
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ],
                      ),
                    ],
                  ),
                  trailing: Text(
                    attendedClasses.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headline2
                        .apply(color: Theme.of(context).accentColor),
                  ),
                ),
                Divider(
                  height: 0,
                  thickness: 1,
                ),
              ],
            ),
          ),
        ),
      );

  String _getOrdinal(int i) {
    var suffixes = ["th", "st", "nd", "rd", "th", "th", "th", "th", "th", "th"];
    switch (i % 100) {
      case 11:
      case 12:
      case 13:
        return "${i}th";
      default:
        return "$i${suffixes[i % 10]}";
    }
  }
}
