// @dart=2.9

import 'package:checkin/src/blocs/graduation/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/ui/components/empty_widget.dart';
import 'package:checkin/src/ui/components/stats/graduate_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GraduateFab extends StatelessWidget {
  const GraduateFab({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GraduationBloc, GraduationState>(
      builder: (BuildContext context, GraduationState state) {
        return state.map(
          initialGraduationState: (_) => EmptyWidget(),
          graduationLoaded: (GraduationLoaded state) =>
              state.isVisible ? GraduateFabView() : EmptyWidget(),
        );
      },
    );
  }
}

class GraduateFabView extends StatelessWidget {
  static const String graduateStudent = 'Graduate student';

  const GraduateFabView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        key: Key("graduateFab"),
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => BlocProvider.value(
              value: context.watch<GraduationBloc>(),
              child: GraduateDialog(),
            ),
          );
        },
        icon: Icon(Icons.add),
        label: Text(
          graduateStudent.i18n.toUpperCase(),
          style: Theme.of(context).textTheme.button,
        ));
  }
}
