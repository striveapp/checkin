import 'package:checkin/src/blocs/edit_lesson/bloc.dart';
import 'package:checkin/src/blocs/registry/bloc.dart';
import 'package:checkin/src/repositories/image_repository.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:checkin/src/repositories/storage_repository.dart';
import 'package:checkin/src/ui/components/empty_widget.dart';
import 'package:checkin/src/ui/components/registry/edit_lesson/edit_lesson_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditLessonButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistryBloc, RegistryState>(
        builder: (BuildContext context, RegistryState state) {
      return state.maybeMap(
          registryLoaded: (RegistryLoaded registryState) {
            return !registryState.currentLesson.isClosed && registryState.currentUser.isOwner
                ? ElevatedButton(
                    key: Key('editClassButton'),
                    style: ElevatedButton.styleFrom(
                      elevation: 2.0,
                      padding: EdgeInsets.all(10.0),
                      shape: CircleBorder(),
                      minimumSize: Size(40, 40),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
                          context: context,
                          isScrollControlled: true,
                          builder: (_) => BlocProvider.value(
                              value: EditLessonBloc(
                                gymId: registryState.currentUser.selectedGymId,
                                lesson: registryState.currentLesson,
                                lessonRepository: context.read<LessonRepository>(),
                                imageRepository: context.read<ImageRepository>(),
                                storageRepository: context.read<StorageRepository>(),
                              ),
                              child: EditLessonModal(
                                  gymId: registryState.currentUser.selectedGymId,
                                  lesson: registryState.currentLesson)));
                    },
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 22,
                    ),
                  )
                : EmptyWidget();
          },
          orElse: () => EmptyWidget());
    });
  }
}
