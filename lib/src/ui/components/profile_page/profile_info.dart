import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/ui/components/placeholder_image.dart';
import 'package:checkin/src/ui/components/placeholder_text.dart';
import 'package:checkin/src/ui/components/profile_page/image_with_grade.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileInfo extends StatelessWidget {
  static const String beltColor = '%s Belt';

  const ProfileInfo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) => state.map(
          initialProfileState: (_) => PlaceholderView(),
          profileLoaded: (ProfileLoaded state) => Column(
            children: [
              ImageWithGrade(grade: state.profileUser.grade),
              SizedBox(
                height: 5,
              ),
              Text(
                state.profileUser.name,
                style: Theme.of(context).textTheme.headline2,
              ),
              SizedBox(
                height: 2.5,
              ),
              Text(
                beltColor.i18n.fill([state.profileUser.grade.name.i18n]),
                style: Theme.of(context).textTheme.headline5.apply(
                      color: state.profileUser.grade.color,
                      fontWeightDelta: 2,
                    ),
              ),
            ],
          ),
        ),
      );
}

class PlaceholderView extends StatelessWidget {
  const PlaceholderView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PlaceholderImage(width: 90, height: 90),
        SizedBox(
          height: 10,
        ),
        PlaceholderText(fontHeight: 18, width: 100),
        SizedBox(
          height: 5,
        ),
        PlaceholderText(fontHeight: 14, width: 80),
      ],
    );
  }
}
