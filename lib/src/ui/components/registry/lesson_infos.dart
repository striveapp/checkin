import 'package:checkin/src/blocs/registry/bloc.dart';
import 'package:checkin/src/constants.dart' as constants;
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/master.dart';
import 'package:checkin/src/ui/components/loading_indicator.dart';
import 'package:checkin/src/ui/components/user_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonInfos extends StatelessWidget {
  static const String and = 'and';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistryBloc, RegistryState>(
      builder: (BuildContext context, RegistryState state) {
        return state.maybeMap(
          registryLoaded: (RegistryLoaded registryLoaded) {
            var currentLesson = registryLoaded.currentLesson;

            return Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: UserImage(
                    userImage: currentLesson.masters.first.imageUrl,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(currentLesson.name, style: Theme.of(context).textTheme.headline5),
                    Text("${currentLesson.timeStart} - ${currentLesson.timeEnd}",
                        style: Theme.of(context).textTheme.headline2.apply(fontSizeDelta: 4)),
                    Text(
                      "${constants.by.i18n} ${currentLesson.masters.first.name}",
                      style: Theme.of(context).textTheme.headline3,
                    ),
                    if (currentLesson.masters.length > 1)
                      Text("${and.i18n} ${_getOtherMasterNames(currentLesson.masters)}",
                          style: Theme.of(context).textTheme.headline3),
                  ],
                )
              ],
            );
          },
          orElse: () => LoadingIndicator(),
        );
      },
    );
  }

  String _getOtherMasterNames(List<Master> masters) =>
      masters.skip(1).map((master) => master.name).join(", ");
}
