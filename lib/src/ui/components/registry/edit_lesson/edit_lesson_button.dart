import 'package:checkin/src/blocs/edit_lesson/bloc.dart';
import 'package:checkin/src/blocs/registry/bloc.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/repositories/image_repository.dart';
import 'package:checkin/src/repositories/lesson_repository.dart';
import 'package:checkin/src/repositories/storage_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:checkin/src/ui/components/registry/edit_lesson/edit_lesson_modal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditLessonButton extends StatelessWidget {
  final String selectedGymId;
  final Lesson currentLesson;

  const EditLessonButton({
    Key key,
    @required this.selectedGymId,
    @required this.currentLesson,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistryBloc, RegistryState>(
        builder: (BuildContext context, RegistryState state) {
      return ElevatedButton(
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
                borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              ),
              context: context,
              isScrollControlled: true,
              builder: (_) => BlocProvider.value(
                  value: EditLessonBloc(
                    gymId: selectedGymId,
                    lesson: currentLesson,
                    lessonRepository: context.read<LessonRepository>(),
                    imageRepository: context.read<ImageRepository>(),
                    storageRepository: context.read<StorageRepository>(),
                    userRepository: context.read<UserRepository>(),
                  )..add(RetrieveMasters()),
                  child: EditLessonModal(gymId: selectedGymId, lesson: currentLesson)));
        },
        child: Icon(
          Icons.edit,
          color: Colors.white,
          size: 22,
        ),
      );
    });
  }
}
