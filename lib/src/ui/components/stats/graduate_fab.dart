import 'package:checkin/src/blocs/graduation/bloc.dart';
import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/graduation_system_repository.dart';
import 'package:checkin/src/repositories/stats_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
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
      builder: (BuildContext context, ProfileState state) => state.when(
        initialProfileState: () => EmptyWidget(),
        profileLoaded: (User profileUser, bool isCurrentUser) => BlocProvider<GraduationBloc>(
          create: (BuildContext context) => GraduationBloc(
            graduationSystemRepository: RepositoryProvider.of<GraduationSystemRepository>(context),
            userRepository: RepositoryProvider.of<UserRepository>(context),
            statsRepository: RepositoryProvider.of<StatsRepository>(context),
            graduationUtils: GraduationUtil(),
            userEmail: profileUser.email,
            userGrade: profileUser.grade,
            gymId: profileUser.selectedGymId,
          ),
          child: BlocBuilder<GraduationBloc, GraduationState>(
              builder: (BuildContext context, GraduationState state) {
            return FloatingActionButton.extended(
                key: Key("graduateFab"),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (_) => GraduateDialog(
                      graduationState: state,
                      currentUserGrade: profileUser.grade,
                    ).build(context),
                  );
                },
                icon: Icon(Icons.add),
                label: Text(
                  graduateStudent.toUpperCase(),
                  style: Theme.of(context).textTheme.button,
                ));
          }),
        ),
      ),
    );
  }
}
