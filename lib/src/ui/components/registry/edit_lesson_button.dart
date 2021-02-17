import 'package:checkin/src/blocs/registry/bloc.dart';
import 'package:checkin/src/ui/components/empty_widget.dart';
import 'package:checkin/src/ui/components/registry/edit_lesson_modal.dart';
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
                ? RawMaterialButton(
                    key: Key('editClassButton'),
                    constraints: BoxConstraints(minHeight: 0, minWidth: 0),
                    onPressed: () {
                      showModalBottomSheet(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(top: Radius.circular(15))),
                          context: context,
                          isScrollControlled: true,
                          builder: (_) => BlocProvider.value(
                              value: context.read<RegistryBloc>(),
                              child: EditLessonModal(
                                  gymId: registryState.currentUser.selectedGymId,
                                  lesson: registryState.currentLesson)));
                    },
                    elevation: 2.0,
                    fillColor: Theme.of(context).buttonColor,
                    child: Icon(
                      Icons.edit,
                      color: Colors.white,
                      size: 22,
                    ),
                    padding: EdgeInsets.all(10.0),
                    shape: CircleBorder(),
                  )
                : EmptyWidget();
          },
          orElse: () => EmptyWidget());
    });
  }
}
