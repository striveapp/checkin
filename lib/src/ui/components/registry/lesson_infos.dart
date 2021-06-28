// @dart=2.9

import 'package:checkin/src/blocs/registry/bloc.dart';
import 'package:checkin/src/ui/components/placeholder_image.dart';
import 'package:checkin/src/ui/components/placeholder_text.dart';
import 'package:checkin/src/ui/components/registry/edit_lesson/editable_lesson_image.dart';
import 'package:checkin/src/ui/components/rounded_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'lesson_time.dart';

class LessonInfos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistryBloc, RegistryState>(
      buildWhen: (RegistryState previous, RegistryState current) => !(current is RegistryLoading),
      builder: (BuildContext context, RegistryState state) {
        return state.maybeMap(
          registryLoaded: (RegistryLoaded registryLoaded) {
            var currentLesson = registryLoaded.currentLesson;
            var currentUser = registryLoaded.currentUser;

            return Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: currentUser.isOwner
                      ? EditableLessonImage(
                          currentUser: currentUser,
                          currentLesson: currentLesson,
                        )
                      : RoundedImage(
                          url: currentLesson.imageUrl,
                          isGrayscale: currentLesson.isClosed,
                        ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        currentLesson.name,
                        style: Theme.of(context).textTheme.headline5.apply(
                              color:
                                  currentLesson.isClosed ? Theme.of(context).disabledColor : null,
                            ),
                      ),
                      LessonTime(
                        timeStart: currentLesson.timeStart,
                        timeEnd: currentLesson.timeEnd,
                        isClosed: currentLesson.isClosed,
                      ),
                      if (currentLesson.masters.isNotEmpty)
                        Text(
                          currentLesson.masters.first.name,
                          style: Theme.of(context).textTheme.headline3.apply(
                                color:
                                    currentLesson.isClosed ? Theme.of(context).disabledColor : null,
                              ),
                        ),
                    ],
                  ),
                )
              ],
            );
          },
          orElse: () => PlaceholderLessonInfos(),
        );
      },
    );
  }
}

class PlaceholderLessonInfos extends StatelessWidget {
  const PlaceholderLessonInfos({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: PlaceholderImage(
            width: 50,
            height: 50,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            PlaceholderText(fontHeight: 16, width: 130),
            SizedBox(
              height: 5,
            ),
            PlaceholderText(fontHeight: 14, width: 100),
          ],
        )
      ],
    );
  }
}
