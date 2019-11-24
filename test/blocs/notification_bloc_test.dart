import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:mockito/mockito.dart';
import 'package:platform/platform.dart';
import 'package:test/test.dart';

class MockUserBloc extends Mock implements UserBloc {}

class MockFirebaseMessaging extends Mock implements FirebaseMessaging {}

class MockPlatform extends Mock implements LocalPlatform {}

class MockIosNotificationSettings extends Mock
    implements IosNotificationSettings {}

void main() {
  group("NotificationsBloc", () {
//    NotificationsBloc notificatonsBloc;
//    MockUserBloc mockUserBloc;
//    MockFirebaseMessaging mockFirebaseMessaging;
//    MockPlatform mockPlatform;
//
//    String fakeToken = "some token";
//
//    setUp(() {
//      mockUserBloc = MockUserBloc();
//      mockFirebaseMessaging = MockFirebaseMessaging();
//      mockPlatform = MockPlatform();
//
//      when(mockFirebaseMessaging.configure);
//      notificatonsBloc = NotificationsBloc(
//          notificationProvider: mockFirebaseMessaging,
//          userBloc: mockUserBloc,
//          platform: mockPlatform);
//    });
//
//    test("initial state is NotificationUninitialized", () {
//      expect(notificatonsBloc.initialState, NotificationsUninitialized());
//    });
//
//    group("when Setup is dispatched", () {
//      group("when IOS", () {
//        MockIosNotificationSettings mockIosNotificationSettings;
//
//        setUp(() {
//          mockIosNotificationSettings = MockIosNotificationSettings();
//
//          when(mockPlatform.isIOS).thenReturn(true);
//          when(mockFirebaseMessaging.getToken()).thenAnswer((_) {
//            return Future<String>.value(fakeToken);
//          });
//          when(mockFirebaseMessaging.onIosSettingsRegistered).thenAnswer((_) {
//            return Stream<IosNotificationSettings>.value(
//                mockIosNotificationSettings);
//          });
//        });
//
//        test(
//            "should setup a IOS settings listener,"
//                "request for permission"
//                "get the token and update the user", () async {
//          final expectedState = [
//            NotificationsUninitialized(),
//            NotificationsInitialized()
//          ];
//
//          notificatonsBloc.dispatch(Setup());
//
//          await expectLater(
//            notificatonsBloc.state,
//            emitsInOrder(expectedState),
//          );
//
//          verify(mockUserBloc.dispatch(UpdateFcmToken(newToken: fakeToken)));
//          verify(mockFirebaseMessaging.requestNotificationPermissions(any));
//        });
//      });
//      group("when Android", () {
//        setUp(() {
//          when(mockPlatform.isIOS).thenReturn(false);
//          when(mockFirebaseMessaging.getToken()).thenAnswer((_) {
//            return Future<String>.value(fakeToken);
//          });
//        });
//
//        test("should get the token and update the user", () async {
//          final expectedState = [
//            NotificationsUninitialized(),
//            NotificationsInitialized()
//          ];
//
//          notificatonsBloc.dispatch(Setup());
//
//          await expectLater(
//            notificatonsBloc.state,
//            emitsInOrder(expectedState),
//          );
//          verify(mockUserBloc.dispatch(UpdateFcmToken(newToken: fakeToken)));
//        });
//      });
//    });
//
//    group("when ShowDialog is dispatched", () {
//      test("the next state will be NotificationLoaded", () async {
//        BasicNotification fakeNotification = BasicNotification(
//            "Lord is a title", "Thi is a sexy body");
//        final expectedState = [
//          NotificationsUninitialized(),
//          BasicNotificationsLoaded(notification: fakeNotification)
//        ];
//
//        notificatonsBloc.dispatch(ShowDialog(notification: fakeNotification));
//
//        await expectLater(
//          notificatonsBloc.state,
//          emitsInOrder(expectedState),
//        );
//      });
//    });
//
//    group("when GoToLesson is dispatched", () {
//      test("the next state will be MasterNotificationsLoaded", () async {
//        String fakeLessonId = "a lesson id";
//        final expectedState = [
//          NotificationsUninitialized(),
//          ActionNotificationsLoaded(lessonId: fakeLessonId)
//        ];
//
//        notificatonsBloc.dispatch(GoToLesson(lessonId: fakeLessonId));
//
//        await expectLater(
//            notificatonsBloc.state,
//            emitsInOrder(expectedState),
//        );
//      });
//    });

    //TODO all the logic inside the callbacks method is not tested at the moment
    // we should refactor the code a bit in order to make it testable
  });
}
