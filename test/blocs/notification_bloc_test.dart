
import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/notification/notification_bloc.dart';
import 'package:checkin/src/blocs/notification/notification_event.dart';
import 'package:checkin/src/repositories/notification_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'helper/mock_helper.dart';

class MockNotificationRepository extends Mock implements NotificationRepository {}

void main() {
  group("NotificationBloc", () {
    MockNotificationRepository mockNotificationRepository;

    setUp(() {
      mockNotificationRepository = MockNotificationRepository();

      configureThrowOnMissingStub([
        mockNotificationRepository
      ]);
    });

    tearDown(() {
      logAndVerifyNoMoreInteractions([
        mockNotificationRepository
      ]);
    });

    group("on InitializeNotifications event", () {
      setUp(() {
        when(mockNotificationRepository.requestPermission()).thenAnswer((realInvocation) => Future.value(null));
      });

      tearDown(() {
        verify(mockNotificationRepository.requestPermission());
      });

      blocTest(
        "should request permissions",
        build: () => NotificationBloc(notificationRepository: mockNotificationRepository),
        act: (bloc) => bloc.add(InitializeNotifications()),
        expect: () => [],
      );
    });
  });
}
