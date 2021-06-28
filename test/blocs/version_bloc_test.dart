// @dart=2.9

import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/version/bloc.dart';
import 'package:checkin/src/repositories/version_repository.dart';
import 'package:checkin/src/util/version_util.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pub_semver/pub_semver.dart';

import 'helper/mock_helper.dart';

class MockVersionRepository extends Mock implements VersionRepository {}

class MockVersionUtil extends Mock implements VersionUtil {}

void main() {
  group("VersionBloc", () {
    MockVersionRepository mockVersionRepository;
    MockVersionUtil mockVersionUtil;

    setUp(() {
      mockVersionRepository = MockVersionRepository();
      mockVersionUtil = MockVersionUtil();
      configureThrowOnMissingStub([
        mockVersionRepository,
        mockVersionUtil,
      ]);
    });

    tearDown(() {
      logAndVerifyNoMoreInteractions([
        mockVersionRepository,
        mockVersionUtil,
      ]);
    });

    group("initial state", () {
      VersionBloc versionBloc;

      setUp(() {
        when(mockVersionRepository.getMinimumVersionRequired())
            .thenAnswer((realInvocation) => Stream.empty());
        versionBloc = VersionBloc(
          versionRepository: mockVersionRepository,
          versionUtil: mockVersionUtil,
        );
      });

      test('is VersionInitial', () {
        expect(versionBloc.state, VersionInitial());
      });

      tearDown(() {
        verify(mockVersionRepository.getMinimumVersionRequired());
        versionBloc?.close();
      });
    });

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
            build: () =>
                VersionBloc(versionRepository: mockVersionRepository, versionUtil: mockVersionUtil),
            expect: () => []);
      });

      group("when minimum is lower than currentVersion[1.0.1]", () {
        String fakeCurrentVersion = "1.0.1";

        setUp(() {
          when(mockVersionRepository.getMinimumVersionRequired()).thenAnswer((_) {
            return Stream<String>.value("1.0.0");
          });

          when(mockVersionUtil.getCurrentVersion())
              .thenAnswer((realInvocation) => Future.value(Version.parse(fakeCurrentVersion)));
        });

        tearDown(() async {
          await untilCalled(mockVersionRepository.getMinimumVersionRequired());
          verify(mockVersionRepository.getMinimumVersionRequired());
          verify(mockVersionUtil.getCurrentVersion());
        });

        blocTest("should emit no states",
            build: () => VersionBloc(
                  versionRepository: mockVersionRepository,
                  versionUtil: mockVersionUtil,
                ),
            expect: () => []);
      });

      group("when minimum is equal to currentVersion[1.0.1]", () {
        String fakeCurrentVersion = "1.0.1";

        setUp(() {
          when(mockVersionRepository.getMinimumVersionRequired()).thenAnswer((_) {
            return Stream<String>.value("1.0.1");
          });

          when(mockVersionUtil.getCurrentVersion())
              .thenAnswer((realInvocation) => Future.value(Version.parse(fakeCurrentVersion)));
        });

        tearDown(() async {
          await untilCalled(mockVersionRepository.getMinimumVersionRequired());
          verify(mockVersionRepository.getMinimumVersionRequired());
          verify(mockVersionUtil.getCurrentVersion());
        });

        blocTest("should emit no states",
            build: () => VersionBloc(
                  versionRepository: mockVersionRepository,
                  versionUtil: mockVersionUtil,
                ),
            expect: () => []);
      });

      group("when minimum is higher than currentVersion[1.0.1]", () {
        String fakeCurrentVersion = "1.0.1";

        setUp(() {
          when(mockVersionRepository.getMinimumVersionRequired()).thenAnswer((_) {
            return Stream<String>.value("2.0.0");
          });

          when(mockVersionUtil.getCurrentVersion())
              .thenAnswer((realInvocation) => Future.value(Version.parse(fakeCurrentVersion)));
        });

        tearDown(() async {
          await untilCalled(mockVersionRepository.getMinimumVersionRequired());
          verify(mockVersionRepository.getMinimumVersionRequired());
          verify(mockVersionUtil.getCurrentVersion());
        });

        blocTest("should emit UpdateRequired",
            build: () => VersionBloc(
                  versionRepository: mockVersionRepository,
                  versionUtil: mockVersionUtil,
                ),
            expect: () => [UpdateRequired()]);
      });
    });
  });
}
