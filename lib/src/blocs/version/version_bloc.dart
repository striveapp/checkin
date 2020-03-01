import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:checkin/src/repositories/version_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:package_info/package_info.dart';
import 'package:pub_semver/pub_semver.dart';

import 'bloc.dart';

class VersionBloc extends Bloc<VersionEvent, VersionState> {
  @override
  VersionState get initialState => VersionInitial();

  final VersionRepository versionRepository;
  StreamSubscription<String> versionSub;


  VersionBloc({
    @required this.versionRepository,
  })  : assert(versionRepository != null) {
    versionSub = this.versionRepository.getMinimumVersionRequired().listen((minimumVersionRequired) {
      if(minimumVersionRequired != null) {
        add(VersionUpdated(minimumVersionRequired: minimumVersionRequired));
      }
    });
  }

  @override
  Stream<VersionState> mapEventToState(VersionEvent event) async* {
    if (event is VersionUpdated) {
      PackageInfo packageInfo = await PackageInfo.fromPlatform();

      final minimumVersionRequired = VersionConstraint.parse(
          '^${event.minimumVersionRequired}');

      Version currentVersion = Version.parse(packageInfo.version);
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

