import 'package:checkin/src/blocs/registry/bloc.dart';
import 'package:checkin/src/ui/components/empty_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'close_class_dialog.dart';

class CloseLessonButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RegistryBloc, RegistryState>(
        builder: (BuildContext context, RegistryState state) {
      return state.maybeMap(
          registryLoaded: (RegistryLoaded registryState) {
            return !registryState.currentLesson.isClosed
                ? RawMaterialButton(
                    constraints: BoxConstraints(minHeight: 0, minWidth: 0),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (_) => CloseClassDialog(
                          selectedGymId: registryState.currentUser.selectedGymId,
                        ).build(context),
                      );
                    },
                    elevation: 2.0,
                    fillColor: Theme.of(context).accentColor,
                    child: Icon(
                      Icons.close,
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
