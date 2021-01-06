import 'package:checkin/src/blocs/gym/bloc.dart';
import 'package:checkin/src/ui/components/base_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GymAppBar extends BaseAppBar {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GymBloc, GymState>(
        buildWhen: (GymState prev, GymState curr) {
      if (prev is GymLoaded && curr is GymLoaded) {
        return prev.gym.name != curr.gym.name;
      }
      return prev is InitialGymState;
    }, builder: (BuildContext context, GymState state) {
      return state.map(
        initialGymState: (InitialGymState state) => BaseAppBar(),
        gymLoaded: (GymLoaded gymLoaded) => BaseAppBar(
          title: gymLoaded.gym.name,
        ),
      );
    });
  }
}
