import 'package:checkin/src/blocs/registry/bloc.dart';
import 'package:checkin/src/ui/components/empty_widget.dart';
import 'package:checkin/src/ui/components/registry/close_lesson_button.dart';
import 'package:checkin/src/ui/components/registry/delete_lesson/delete_lesson_button.dart';
import 'package:checkin/src/ui/components/registry/edit_lesson/edit_lesson_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonActions extends StatelessWidget {
  const LessonActions({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistryBloc, RegistryState>(
        builder: (BuildContext context, RegistryState state) {
      return state.maybeMap(
          registryLoaded: (RegistryLoaded registryState) {
            var currentLesson = registryState.currentLesson;
            var currentUser = registryState.currentUser;
            return Row(
              children: [
                if (!currentLesson.isClosed && currentUser.isOwner)
                  Row(
                    children: [
                      EditLessonButton(
                        currentLesson: currentLesson,
                        selectedGymId: currentUser.selectedGymId,
                      ),
                      CloseLessonButton(
                        selectedGymId: currentUser.selectedGymId,
                      ),
                    ],
                  ),
                if (currentLesson.isClosed)
                  DeleteLessonButton(
                    selectedGymId: currentUser.selectedGymId,
                  ),
              ],
            );
          },
          orElse: () => EmptyWidget());
    });
  }
}
