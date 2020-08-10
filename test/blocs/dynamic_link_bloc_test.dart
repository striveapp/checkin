import 'package:checkin/src/blocs/dynamic_link/bloc.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockFirebaseDynamicLinks extends Mock implements FirebaseDynamicLinks {}

class MockPendingDynamicLinkData extends Mock
    implements PendingDynamicLinkData {}

class MockOnLinkErrorException extends Mock implements OnLinkErrorException {}

class MyDynamicLinkToNavigate extends DynamicLinkToNavigate {

  MyDynamicLinkToNavigate({String path}): super(path: path);

  @override
  bool operator ==(Object other) {
    if( other is DynamicLinkToNavigate ) {
      return path == other.path;
    }
    return false;
  }

}

void main() {
  MockFirebaseDynamicLinks mockFirebaseDynamicLinks;

  group("DynamicLinkBloc", () {
    DynamicLinkBloc dynamicLinkBloc;
    PendingDynamicLinkData fakeData = MockPendingDynamicLinkData();
    String fakeLessonId = "123456";
    setUp(() {
      mockFirebaseDynamicLinks = MockFirebaseDynamicLinks();
      when(fakeData.link).thenReturn(
          Uri.parse("https://fakelink.com/path/$fakeLessonId"));
      when(mockFirebaseDynamicLinks.getInitialLink()).thenAnswer((_) {
        return Future<PendingDynamicLinkData>.value(fakeData);
      });

      dynamicLinkBloc = DynamicLinkBloc(dynamicLinks: mockFirebaseDynamicLinks);
    });

    tearDown(() {
      dynamicLinkBloc?.close();
    });

    test("initial state is DynamicLinkInitial", () {
      expect(dynamicLinkBloc.initialState, DynamicLinkInitial());
    });

    group("add DeepLinkSetup", () {
      test(
          "should retrieve the inital link and add DeepLinkReceived with the correct uri",
          () async {
        dynamicLinkBloc.add(DeepLinkSetup());
        final expectedState = [
          DynamicLinkInitial(),
          MyDynamicLinkToNavigate(path: "/path/$fakeLessonId"),
        ];

        await expectLater(
          dynamicLinkBloc,
          emitsInOrder(expectedState),
        );
      });
    });

    group("onLink", () {
      group("onSuccess", () {
        test("should add DeepLinkReceived with the correct link", () async {
          dynamicLinkBloc.onSuccessLink(fakeData);

          final expectedState = [
            DynamicLinkInitial(),
            MyDynamicLinkToNavigate(path: "/path/$fakeLessonId"),
          ];

          await expectLater(
            dynamicLinkBloc,
            emitsInOrder(expectedState),
          );
        });
      });

      group("onError", () {
        test("shoud print an error", () async {
          //TODO: no assertion for now, since there is no logic to be tested
          dynamicLinkBloc.onErrorLink(MockOnLinkErrorException());
          final expectedState = [
            DynamicLinkInitial(),
            DynamicLinkError(),
          ];

          await expectLater(
            dynamicLinkBloc,
            emitsInOrder(expectedState),
          );
        });
      });
    });
  });
}
