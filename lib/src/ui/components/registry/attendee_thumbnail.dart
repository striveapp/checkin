import 'package:checkin/src/blocs/graduation/bloc.dart';
import 'package:checkin/src/ui/components/rounded_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AttendeeThumbnail extends StatelessWidget {
  final String attendeeImage;
  final bool showGraduationIndication;

  const AttendeeThumbnail({
    Key key,
    @required this.attendeeImage,
    this.showGraduationIndication = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GraduationBloc, GraduationState>(
        builder: (BuildContext context, GraduationState state) {
      return state.maybeWhen(
        readyForGraduation: (_) => RoundedImage(
          url: attendeeImage,
          withBorder: showGraduationIndication,
        ),
        orElse: () => RoundedImage(url: attendeeImage),
      );
    });
  }
}
