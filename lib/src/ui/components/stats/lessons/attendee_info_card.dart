// @dart=2.9

import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/ui/components/placeholder_image.dart';
import 'package:checkin/src/ui/components/placeholder_text.dart';
import 'package:checkin/src/ui/components/rounded_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttendeeInfoCard extends StatefulWidget {
  final String attendeeEmail;
  final int attendedLessons;

  static const String beltColor = '%s Belt';

  AttendeeInfoCard({
    @required this.attendeeEmail,
    @required this.attendedLessons,
  });

  @override
  _AttendeeInfoCardState createState() => _AttendeeInfoCardState();
}

class _AttendeeInfoCardState extends State<AttendeeInfoCard> {
  ProfileBloc _bloc;

  @override
  void dispose() {
    super.dispose();
    _bloc?.close();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = ProfileBloc(
      userRepository: context.watch(),
      storageRepository: context.watch(),
      imageRepository: context.watch(),
      nonCurrentUserEmail: widget.attendeeEmail,
    )..add(InitializeProfile());
    return Card(
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: BlocBuilder<ProfileBloc, ProfileState>(
              bloc: _bloc,
              builder: (context, state) {
                return state.map(
                  initialProfileState: (InitialProfileState state) => Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      PlaceholderImage(
                        height: 50,
                        width: 50,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          PlaceholderText(
                            fontHeight: 16,
                            width: 145,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          PlaceholderText(
                            fontHeight: 14,
                            width: 120,
                          ),
                        ],
                      ),
                    ],
                  ),
                  profileLoaded: (ProfileLoaded state) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(flex: 1, child: RoundedImage(url: state.profileUser.imageUrl)),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              state.profileUser.name,
                              style:
                                  Theme.of(context).textTheme.headline4.apply(fontWeightDelta: 4),
                            ),
                            Text(
                                AttendeeInfoCard.beltColor.i18n
                                    .fill([state.profileUser.grade.name.i18n]),
                                style: Theme.of(context).textTheme.headline5),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          widget.attendedLessons.toString(),
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headline1
                              .apply(color: Theme.of(context).colorScheme.secondary),
                        ),
                      ),
                    ],
                  ),
                );
              },
            )));
  }
}
