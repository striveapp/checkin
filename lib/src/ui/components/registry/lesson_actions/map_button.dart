// @dart=2.9

import 'package:checkin/src/blocs/registry/bloc.dart';
import 'package:checkin/src/util/url_launcher_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MapButton extends StatelessWidget {
  final String locationUrl;

  const MapButton({
    Key key,
    @required this.locationUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistryBloc, RegistryState>(
        builder: (BuildContext context, RegistryState state) {
      return ElevatedButton(
        key: Key('mapButton'),
        style: ElevatedButton.styleFrom(
          elevation: 2.0,
          padding: EdgeInsets.all(10.0),
          shape: CircleBorder(),
          minimumSize: Size(40, 40),
        ),
        onPressed: () async {
          await UrlLauncherUtil().launchUrl(locationUrl);
        },
        child: Icon(
          Icons.location_on,
          color: Colors.white,
          size: 22,
        ),
      );
    });
  }
}
