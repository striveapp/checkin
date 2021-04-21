import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/notification/notification_bloc.dart';
import 'package:checkin/src/blocs/notification/notification_event.dart';
import 'package:checkin/src/repositories/notification_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'helper/mock_helper.dart';

class MockNotificationRepository extends Mock implements NotificationRepository {}

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  group("NotificationBloc", () {
    MockNotificationRepository mockNotificationRepository;
    MockUserRepository mockUserRepository;

    setUp(() {
      mockNotificationRepository = MockNotificationRepository();
      mockUserRepository = MockUserRepository();

      configureThrowOnMissingStub([
        mockNotificationRepository,
        mockUserRepository,
      ]);
    });

    tearDown(() {
      logAndVerifyNoMoreInteractions([
        mockNotificationRepository,
        mockUserRepository,
      ]);
    });

    group("on InitializeNotifications event", () {
      setUp(() {
        when(mockNotificationRepository.requestPermission())
            .thenAnswer((realInvocation) => Future.value(null));
        when(mockNotificationRepository.getToken())
            .thenAnswer((realInvocation) => Future.value("theGoldenToken"));
        when(mockUserRepository.updateUserFcmToken("the@email.com", "theGoldenToken"))
            .thenAnswer((realInvocation) => Future.value(null));
      });

      tearDown(() {
        verify(mockNotificationRepository.requestPermission());
        verify(mockNotificationRepository.getToken());
        verify(mockUserRepository.updateUserFcmToken("the@email.com", "theGoldenToken"));
      });

      blocTest(
        "should request permissions and save the device token",
        build: () => NotificationBloc(
          notificationRepository: mockNotificationRepository,
          userRepository: mockUserRepository,
        ),
        act: (bloc) => bloc.add(InitializeNotifications(loggedUserEmail: "the@email.com")),
        expect: () => [],
      );
    });
  });
}
