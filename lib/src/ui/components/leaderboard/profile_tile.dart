import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/ui/components/rounded_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class ProfileTile extends StatefulWidget {
  final String profileEmail;
  final int attendedClasses;
  final int position;
  static const String beltColor = '%s Belt';

  ProfileTile({Key key, this.profileEmail, this.attendedClasses, this.position}) : super(key: key);

  @override
  _ProfileTileState createState() => _ProfileTileState();
}

class _ProfileTileState extends State<ProfileTile> {
  ProfileBloc _bloc;

  @override
  void dispose() {
    super.dispose();
    _bloc?.close();
  }

  @override
  Widget build(BuildContext context) {
    if (_bloc == null) {
      _bloc = ProfileBloc(
        userRepository: context.watch(),
        storageRepository: context.watch(),
        imageRepository: context.watch(),
        nonCurrentUserEmail: widget.profileEmail,
      )..add(InitializeProfile());
    }

    return BlocBuilder<ProfileBloc, ProfileState>(
      bloc: _bloc,
      builder: (BuildContext context, ProfileState state) => state.map(
        initialProfileState: (InitialProfileState _) => ShimmedProfileTileView(
          position: _getOrdinal(widget.position),
        ),
        profileLoaded: (ProfileLoaded state) => ProfileTileView(
          profileUser: state.profileUser,
          position: _getOrdinal(widget.position),
          attendedClasses: widget.attendedClasses,
        ),
      ),
    );
  }

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

class ProfileTileView extends StatelessWidget {
  final User profileUser;
  final String position;
  final int attendedClasses;

  const ProfileTileView({
    Key key,
    this.profileUser,
    this.position,
    this.attendedClasses,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          onTap: () {
            Navigator.of(context).pushNamed('stats/${profileUser.email}');
          },
          leading: Text(
            position,
            style: Theme.of(context).textTheme.bodyText1.apply(fontWeightDelta: 3),
          ),
          title: Row(
            children: <Widget>[
              RoundedImage(
                url: profileUser.imageUrl,
                width: 40,
                height: 40,
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      profileUser.name,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline4.apply(fontWeightDelta: 3),
                    ),
                    SizedBox(
                      height: 2.5,
                    ),
                    Text(
                      ProfileTile.beltColor.i18n.fill([profileUser.grade.name.i18n]),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                ),
              ),
            ],
          ),
          trailing: Text(
            attendedClasses.toString(),
            style:
                Theme.of(context).textTheme.headline2.apply(color: Theme.of(context).accentColor),
          ),
        ),
        Divider(
          height: 0,
          thickness: 1,
        ),
      ],
    );
  }
}

class ShimmedProfileTileView extends StatelessWidget {
  final String position;

  const ShimmedProfileTileView({
    Key key,
    this.position,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Text(
            position,
            style: Theme.of(context).textTheme.bodyText1.apply(fontWeightDelta: 3),
          ),
          title: Row(
            children: <Widget>[
              Shimmer.fromColors(
                baseColor: Theme.of(context).backgroundColor.withAlpha(100),
                highlightColor: Theme.of(context).backgroundColor,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey,
                  ),
                  width: 40,
                  height: 40,
                ),
              ),
              SizedBox(
                width: 15,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Shimmer.fromColors(
                      baseColor: Theme.of(context).backgroundColor.withAlpha(100),
                      highlightColor: Theme.of(context).backgroundColor,
                      child: Container(
                        height: 16,
                        width: 145,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Shimmer.fromColors(
                      baseColor: Theme.of(context).backgroundColor.withAlpha(100),
                      highlightColor: Theme.of(context).backgroundColor,
                      child: Container(
                        height: 12,
                        width: 90,
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 0,
          thickness: 1,
        ),
      ],
    );
  }
}
