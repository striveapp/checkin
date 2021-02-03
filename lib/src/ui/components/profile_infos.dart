import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/ui/components/empty_widget.dart';
import 'package:checkin/src/ui/components/user_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileInfos extends StatelessWidget {
  final String userEmail;

  static const String beltColor = '%s Belt';

  ProfileInfos({
    @required this.userEmail,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
      child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (BuildContext context, ProfileState state) => state.map(
              initialProfileState: (InitialProfileState _) => EmptyWidget(),
              profileLoaded: (ProfileLoaded state) => Row(
                    children: <Widget>[
                      UserImage(
                        userImage: state.profileUser.imageUrl,
                        width: 30,
                        height: 30,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              state.profileUser.name,
                              style:
                                  Theme.of(context).textTheme.bodyText1.apply(fontWeightDelta: 2),
                            ),
                            SizedBox(
                              height: 2.5,
                            ),
                            Text(
                              beltColor.i18n.fill([state.profileUser.grade.name.i18n]),
                              key: Key("userGrade"),
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ))),
    );
  }
}
