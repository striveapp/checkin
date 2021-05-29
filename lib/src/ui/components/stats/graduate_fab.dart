import 'package:checkin/src/blocs/graduation/bloc.dart';
import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/localization/localization.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/ui/components/empty_widget.dart';
import 'package:checkin/src/ui/components/stats/graduate_dialog.dart';
import 'package:checkin/src/util/graduation_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GraduateFab extends StatelessWidget {
  final String userEmail;

  const GraduateFab({
    Key key,
    @required this.userEmail,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (BuildContext context, UserState state) {
        return state.maybeWhen(
          userSuccess: (User currentUser) => currentUser.isOwner && userEmail != currentUser.email
              ? GraduateFabView()
              : EmptyWidget(),
          orElse: () => EmptyWidget(),
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
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (BuildContext context, ProfileState state) => state.map(
        initialProfileState: (InitialProfileState _) => EmptyWidget(),
        profileLoaded: (ProfileLoaded state) => BlocProvider<GraduationBloc>(
          create: (BuildContext context) => GraduationBloc(
            graduationSystemRepository: context.read(),
            userRepository: context.read(),
            statsRepository: context.read(),
            graduationUtils: GraduationUtil(),
            userEmail: state.profileUser.email,
          )..add(InitializeGraduation()),
          child: ShowGraduationModal(
            graduateStudent: graduateStudent,
            currentUserGrade: state.profileUser.grade,
          ),
        ),
      ),
    );
  }
}

class ShowGraduationModal extends StatelessWidget {
  const ShowGraduationModal({
    Key key,
    @required this.graduateStudent,
    @required this.currentUserGrade,
  }) : super(key: key);

  final String graduateStudent;
  final Grade currentUserGrade;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
        key: Key("graduateFab"),
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => BlocProvider.value(
              value: context.watch<GraduationBloc>(),
              child: GraduateDialog(
                currentUserGrade: currentUserGrade,
              ),
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
