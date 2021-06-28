// @dart=2.9

import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/notification/notification_bloc.dart';
import 'package:checkin/src/blocs/notification/notification_event.dart';
import 'package:checkin/src/blocs/notification/notification_state.dart';
import 'package:checkin/src/models/notification.dart';
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
      group("when initialMessage is empty", () {
        setUp(() {
          when(mockNotificationRepository.requestPermission())
              .thenAnswer((realInvocation) => Future.value(null));

          when(mockNotificationRepository.getInitialMessage())
              .thenAnswer((realInvocation) => Future.value(null));
          when(mockNotificationRepository.onMessageOpenedApp())
              .thenAnswer((realInvocation) => Stream.empty());
          when(mockNotificationRepository.onMessage())
              .thenAnswer((realInvocation) => Stream.empty());
        });

        tearDown(() {
          verify(mockNotificationRepository.requestPermission());

          verify(mockNotificationRepository.getInitialMessage());
          verify(mockNotificationRepository.onMessageOpenedApp());
          verify(mockNotificationRepository.onMessage());
        });

        blocTest(
          "request permissions and setup callbacks",
          build: () => NotificationBloc(
            notificationRepository: mockNotificationRepository,
            userRepository: mockUserRepository,
          ),
          act: (bloc) => bloc.add(InitializeNotifications()),
          expect: () => [],
        );
      });

      group("when initialMessage is NOT empty", () {
        setUp(() {
          when(mockNotificationRepository.requestPermission())
              .thenAnswer((realInvocation) => Future.value(null));

          when(mockNotificationRepository.getInitialMessage()).thenAnswer((realInvocation) =>
              Future.value(RoutableNotification(title: "title", path: "/navigate/here")));
          when(mockNotificationRepository.onMessageOpenedApp())
              .thenAnswer((realInvocation) => Stream.empty());
          when(mockNotificationRepository.onMessage())
              .thenAnswer((realInvocation) => Stream.empty());
        });

        tearDown(() {
          verify(mockNotificationRepository.requestPermission());

          verify(mockNotificationRepository.getInitialMessage());
          verify(mockNotificationRepository.onMessageOpenedApp());
          verify(mockNotificationRepository.onMessage());
        });

        blocTest(
          "route to the notification path",
          build: () => NotificationBloc(
            notificationRepository: mockNotificationRepository,
            userRepository: mockUserRepository,
          ),
          act: (bloc) => bloc.add(InitializeNotifications()),
          expect: () => [NotificationToNavigate(path: "/navigate/here")],
        );
      });
    });

    group("on UpdateToken", () {
      setUp(() {
        when(mockNotificationRepository.getToken())
            .thenAnswer((realInvocation) => Future.value("theGoldenToken"));
        when(mockUserRepository.updateUserFcmToken("the@email.com", "theGoldenToken"))
            .thenAnswer((realInvocation) => Future.value(null));
      });

      tearDown(() {
        verify(mockNotificationRepository.getToken());
        verify(mockUserRepository.updateUserFcmToken("the@email.com", "theGoldenToken"));
      });

      blocTest(
        "save the device token",
        build: () => NotificationBloc(
          notificationRepository: mockNotificationRepository,
          userRepository: mockUserRepository,
        ),
        act: (bloc) => bloc.add(UpdateToken(loggedUserEmail: "the@email.com")),
        expect: () => [],
      );
    });

    group("on MessageOpenedApp", () {
      blocTest(
        "route to the notification path",
        build: () => NotificationBloc(
          notificationRepository: mockNotificationRepository,
          userRepository: mockUserRepository,
        ),
        act: (bloc) => bloc.add(
            MessageOpenedApp(notification: RoutableNotification(title: "title", path: "/foo/bar"))),
        expect: () => [NotificationToNavigate(path: "/foo/bar")],
      );
    });

    group("on Message", () {
      blocTest(
        "dispaly the notification body",
        build: () => NotificationBloc(
          notificationRepository: mockNotificationRepository,
          userRepository: mockUserRepository,
        ),
        act: (bloc) => bloc
            .add(MessageOpenedApp(notification: BasicNotification(title: "title", body: "body"))),
        expect: () => [ShowSnackBar(title: "title", body: "body")],
      );
    });
  });
}
