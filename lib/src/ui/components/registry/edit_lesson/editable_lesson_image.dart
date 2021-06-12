import 'package:checkin/src/blocs/edit_lesson/bloc.dart';
import 'package:checkin/src/models/lesson.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/ui/components/editable_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditableLessonImage extends StatelessWidget {
  final User currentUser;
  final Lesson currentLesson;

  const EditableLessonImage({
    Key key,
    @required this.currentUser,
    @required this.currentLesson,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EditLessonBloc>(
      create: (context) => EditLessonBloc(
        gymId: currentUser.selectedGymId,
        lesson: currentLesson,
        lessonRepository: context.read(),
        imageRepository: context.read(),
        storageRepository: context.read(),
        userRepository: context.read(),
      ),
      child: Builder(
          builder: (context) => EditableImage(
                imageUrl: currentLesson.imageUrl,
                isGrayscale: currentLesson.isClosed,
                onEdit: () {
                  context.read<EditLessonBloc>().add(UpdateImageUrl());
                },
              )),
    );
  }
}
