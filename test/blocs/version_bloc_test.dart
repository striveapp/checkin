import 'package:checkin/src/blocs/version/bloc.dart';
import 'package:checkin/src/repositories/version_repository.dart';
import 'package:checkin/src/util/date_util.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockVersionRepository extends Mock implements VersionRepository {}

class MockDateUtil extends Mock implements DateUtil {}

void main() {
  group("VersionBloc", ()
  {
    VersionBloc versionBloc;
    MockVersionRepository mockVersionRepository;

    setUp(() {
      mockVersionRepository = MockVersionRepository();

      // set current version to 1.0.0
      TestWidgetsFlutterBinding.ensureInitialized();
      const MethodChannel('plugins.flutter.io/package_info').setMockMethodCallHandler((MethodCall methodCall) async {
        if (methodCall.method == 'getAll') {
          return <String, dynamic>{
            'version': '1.0.0',
          };
        }
        return null;
      });
    });

    tearDown(() {
      versionBloc?.close();
    });

    group("VersionUpdated", () {
      group("when no version", () {
        setUp(() {
          when(mockVersionRepository.getMinimumVersionRequired()).thenAnswer((
              _) {
            return Stream<String>.value(null);
          });
          versionBloc = VersionBloc(versionRepository: mockVersionRepository);
        });

        test("should emit initial state only", () {
          final expectedState = [
            VersionInitial(),
          ];

          expectLater(
            versionBloc,
            emitsInOrder(expectedState),
          );
        });
      });
      group("when minimum is lower than currentVersion[1.0.0]", () {
        setUp(() {
          when(mockVersionRepository.getMinimumVersionRequired()).thenAnswer((
              _) {
            return Stream<String>.value("0.0.1");
          });
          versionBloc = VersionBloc(versionRepository: mockVersionRepository);
        });

        test("should emit initial state only", () {
          final expectedState = [
            VersionInitial(),
          ];

          expectLater(
            versionBloc,
            emitsInOrder(expectedState),
          );
        });
      });

      group("when minimum is equal to currentVersion[1.0.0]", () {
        setUp(() {
          when(mockVersionRepository.getMinimumVersionRequired()).thenAnswer((
              _) {
            return Stream<String>.value("1.0.0");
          });
          versionBloc = VersionBloc(versionRepository: mockVersionRepository);
        });

        test("should emit initial state only", () {
          final expectedState = [
            VersionInitial(),
          ];

          expectLater(
            versionBloc,
            emitsInOrder(expectedState),
          );
        });
      });

      group("when minimum is higher than currentVersion[1.0.0]", () {
        setUp(() {
          when(mockVersionRepository.getMinimumVersionRequired()).thenAnswer((
              _) {
            return Stream<String>.value("2.0.0");
          });
          versionBloc = VersionBloc(versionRepository: mockVersionRepository);
        });

        test("should emit UpdateRequired", () {
          final expectedState = [
            VersionInitial(),
            UpdateRequired()
          ];

          expectLater(
            versionBloc,
            emitsInOrder(expectedState),
          );
        });
      });
    });
  });
}
