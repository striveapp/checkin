import 'package:checkin/src/blocs/lesson/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/master.dart';
import 'package:checkin/src/ui/components/user_image.dart';
import 'package:flutter/material.dart';
import 'package:checkin/src/constants.dart' as constants;
import 'package:flutter_bloc/flutter_bloc.dart';

import '../loading_indicator.dart';

class LessonInfos extends StatelessWidget {
  static const String and = 'and';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonBloc, LessonState>(
      builder: (BuildContext context, LessonState state) {
        if (state is LessonUninitialized || state is LessonLoading) {
          return LoadingIndicator();
        }

        if (state is LessonLoaded) {
          var lesson = state.lesson;
          return Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(right: 16),
                child: UserImage(
                  userImage: lesson.masters.first.imageUrl,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "${lesson.timeStart} - ${lesson.timeEnd}",
                    style: Theme.of(context)
                        .textTheme
                        .headline1
                        .apply(color: Colors.black87),
                  ),
                  Text(
                    "${constants.by.i18n} ${lesson.masters.first.name}",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  if (lesson.masters.length > 1)
                    Text("${and.i18n} ${_getOtherMasterNames(lesson.masters)}",
                        style: Theme.of(context).textTheme.headline3),
                ],
              )
            ],
          );
        }
        return ErrorWidget('Unknown State [$state] received in: lesson_infos');
      },
    );
  }

  String _getOtherMasterNames(List<Master> masters) =>
      masters.skip(1).map((master) => master.name).join(", ");
}
