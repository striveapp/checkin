// @dart=2.9

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/repositories/version_repository.dart';
import 'package:checkin/src/util/version_util.dart';
import 'package:flutter/foundation.dart';
import 'package:pub_semver/pub_semver.dart';

import 'bloc.dart';

class VersionBloc extends Bloc<VersionEvent, VersionState> {
  final VersionRepository versionRepository;
  final VersionUtil versionUtil;

  StreamSubscription<String> versionSub;

  VersionBloc({
    @required this.versionRepository,
    @required this.versionUtil,
  })  : assert(versionRepository != null),
        super(VersionInitial()) {
    versionSub =
        this.versionRepository.getMinimumVersionRequired().listen((minimumVersionRequired) {
      if (minimumVersionRequired != null) {
        add(VersionUpdated(minimumVersionRequired: minimumVersionRequired));
      }
    });
  }

  @override
  Stream<VersionState> mapEventToState(VersionEvent event) async* {
    if (event is VersionUpdated) {
      VersionConstraint minimumVersionRequired =
          VersionConstraint.parse("^${event.minimumVersionRequired}");
      Version currentVersion = await versionUtil.getCurrentVersion();

      if (!minimumVersionRequired.allows(currentVersion)) {
        yield UpdateRequired();
      }
    }
  }

  @override
  Future<void> close() {
    versionSub?.cancel();
    return super.close();
  }
}
