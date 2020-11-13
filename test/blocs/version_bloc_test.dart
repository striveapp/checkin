import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/version/bloc.dart';
import 'package:checkin/src/repositories/version_repository.dart';
import 'package:checkin/src/util/date_util.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'helper/mock_helper.dart';

class MockVersionRepository extends Mock implements VersionRepository {}

class MockDateUtil extends Mock implements DateUtil {}

void main() {

  group("VersionBloc", () {
    MockVersionRepository mockVersionRepository;

    setUp(() {
      mockVersionRepository = MockVersionRepository();
      configureThrowOnMissingStub([mockVersionRepository]);

      // set current version to 1.0.1
      TestWidgetsFlutterBinding.ensureInitialized();
      const MethodChannel('plugins.flutter.io/package_info').setMockMethodCallHandler((MethodCall methodCall) async {
        if (methodCall.method == 'getAll') {
          return <String, dynamic>{
            'version': '1.0.1',
          };
        }
        return null;
      });
    });

    tearDown(() {
      logAndVerifyNoMoreInteractions([mockVersionRepository]);
    });

    // todo missing initial state test

    group("on VersionUpdated event", () {
      group("when no version", () {
        setUp(() {
          when(mockVersionRepository.getMinimumVersionRequired()).thenAnswer((_) {
            return Stream<String>.value(null);
          });
        });

        tearDown(() async {
          await untilCalled(mockVersionRepository.getMinimumVersionRequired());
          verify(mockVersionRepository.getMinimumVersionRequired());
        });

        blocTest("should emit no states",
            build: () => VersionBloc(versionRepository: mockVersionRepository),
            expect: []
        );
      });

      group("when minimum is lower than currentVersion[1.0.1]", () {
        setUp(() {
          when(mockVersionRepository.getMinimumVersionRequired()).thenAnswer((_) {
            return Stream<String>.value("1.0.0");
          });
        });

        tearDown(() async {
          await untilCalled(mockVersionRepository.getMinimumVersionRequired());
          verify(mockVersionRepository.getMinimumVersionRequired());
        });

        blocTest("should emit no states",
            build: () => VersionBloc(versionRepository: mockVersionRepository),
            expect: []
        );
      });

      group("when minimum is equal to currentVersion[1.0.1]", () {
        setUp(() {
          when(mockVersionRepository.getMinimumVersionRequired()).thenAnswer((_) {
            return Stream<String>.value("1.0.1");
          });
        });

        tearDown(() async {
          await untilCalled(mockVersionRepository.getMinimumVersionRequired());
          verify(mockVersionRepository.getMinimumVersionRequired());
        });

        blocTest("should emit no states",
            build: () => VersionBloc(versionRepository: mockVersionRepository),
            expect: []
        );
      });

      group("when minimum is higher than currentVersion[1.0.1]", () {
        setUp(() {
          when(mockVersionRepository.getMinimumVersionRequired()).thenAnswer((_) {
            return Stream<String>.value("2.0.0");
          });
        });

        tearDown(() async {
          await untilCalled(mockVersionRepository.getMinimumVersionRequired());
          verify(mockVersionRepository.getMinimumVersionRequired());
        });

        blocTest("should emit UpdateRequired",
            build: () => VersionBloc(versionRepository: mockVersionRepository),
            expect: [UpdateRequired()]
        );
      });
    });
  });
}
