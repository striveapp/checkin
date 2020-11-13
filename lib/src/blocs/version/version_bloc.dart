import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/repositories/version_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info/package_info.dart';
import 'package:pub_semver/pub_semver.dart';

import 'bloc.dart';

class VersionBloc extends Bloc<VersionEvent, VersionState> {
  final VersionRepository versionRepository;

  StreamSubscription<String> versionSub;

  VersionBloc({
    @required this.versionRepository,
  })  : assert(versionRepository != null),
        super(VersionInitial()) {
    versionSub = this
        .versionRepository
        .getMinimumVersionRequired()
        .listen((minimumVersionRequired) {
      if (minimumVersionRequired != null) {
        add(VersionUpdated(minimumVersionRequired: minimumVersionRequired));
      }
    });
  }

  @override
  Stream<VersionState> mapEventToState(VersionEvent event) async* {
    if (event is VersionUpdated) {
      final minimumVersionRequired =
          VersionConstraint.parse('^${event.minimumVersionRequired}');

      Version currentVersion = await _getCurrentVersion();

      if (!minimumVersionRequired.allows(currentVersion)) {
        yield UpdateRequired();
      }
    }
  }

  Future<Version> _getCurrentVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    Version currentVersion = Version.parse(packageInfo.version);
    return currentVersion;
  }

  @override
  Future<void> close() {
    versionSub?.cancel();
    return super.close();
  }
}
