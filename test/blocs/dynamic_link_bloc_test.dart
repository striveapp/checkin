import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/dynamic_link/bloc.dart';
import 'package:checkin/src/resources/local_storage_provider.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'helper/mock_helper.dart';

class MockFirebaseDynamicLinks extends Mock implements FirebaseDynamicLinks {}

class MockPendingDynamicLinkData extends Mock
    implements PendingDynamicLinkData {}

class MockOnLinkErrorException extends Mock implements OnLinkErrorException {}

class MyDynamicLinkToNavigate extends DynamicLinkToNavigate {
  MyDynamicLinkToNavigate({String path}) : super(path: path);

  @override
  bool operator ==(Object other) {
    if (other is DynamicLinkToNavigate) {
      return path == other.path;
    }
    return false;
  }
}

class MockLocalStorageRepository extends Mock implements LocalStorageProvider {}

void main() {
  group("DynamicLinkBloc", () {
    MockFirebaseDynamicLinks mockFirebaseDynamicLinks;
    MockPendingDynamicLinkData fakeData;
    MockLocalStorageRepository mockLocalStorageRepository;

    String fakeLessonId = "123456";

    setUp(() {
      mockFirebaseDynamicLinks = MockFirebaseDynamicLinks();
      mockLocalStorageRepository = MockLocalStorageRepository();
      fakeData = MockPendingDynamicLinkData();
      configureThrowOnMissingStub(
          [mockFirebaseDynamicLinks, fakeData, mockLocalStorageRepository]);
    });

    tearDown(() {
      logAndVerifyNoMoreInteractions(
          [mockFirebaseDynamicLinks, fakeData, mockLocalStorageRepository]);
    });

    group("initial state", () {
      DynamicLinkBloc dynamicLinkBloc;

      setUp(() {
        dynamicLinkBloc = DynamicLinkBloc(
          dynamicLinks: mockFirebaseDynamicLinks,
          localStorageRepository: mockLocalStorageRepository,
        );
      });

      test('is DynamicLinkInitial', () {
        expect(dynamicLinkBloc.state, DynamicLinkInitial());
      });

      tearDown(() {
        dynamicLinkBloc?.close();
      });
    });

    group("on DeepLinkSetup event", () {
      group("when there is an initialLink", () {
        setUp(() {
          when(mockFirebaseDynamicLinks.getInitialLink()).thenAnswer((_) {
            return Future<PendingDynamicLinkData>.value(fakeData);
          });
          when(fakeData.link)
              .thenReturn(Uri.parse("https://fakelink.com/path/$fakeLessonId"));
        });

        // todo blocv6migration: why another event? DeepLinkReceived seems to only be added inside the bloc, why not directly emit MyDynamicLinkToNavigate?
        blocTest(
          "should add DeepLinkReceived event with the correct uri, and emit MyDynamicLinkToNavigate on the correct path",
          build: () => DynamicLinkBloc(
            dynamicLinks: mockFirebaseDynamicLinks,
            localStorageRepository: mockLocalStorageRepository,
          ),
          act: (bloc) => bloc.add(DeepLinkSetup()),
          expect: [
            MyDynamicLinkToNavigate(path: "/path/$fakeLessonId"),
          ],
          verify: (bloc) {
            verify(mockFirebaseDynamicLinks.onLink(
                onSuccess: anyNamed("onSuccess"),
                onError: anyNamed("onError")));
            verify(mockFirebaseDynamicLinks.getInitialLink());
            verify(fakeData.link);
          },
        );
      });
    });

    group("on DeepLinkReceived event", () {
      group("when the deeplink is a gym referred link", () {
        final fakeReferredDeepLink = Uri(path: "/register/fakeGym");

        setUp(() {
          TestWidgetsFlutterBinding.ensureInitialized();
          when(mockLocalStorageRepository.setReferredGymId(
            "fakeGym",
          )).thenAnswer((_) => Future.value(null));
        });

        tearDown(() {
          verify(mockLocalStorageRepository.setReferredGymId(
            "fakeGym",
          ));
        });

        blocTest(
          "should save the referredGym in the local storage",
          build: () => DynamicLinkBloc(
            dynamicLinks: mockFirebaseDynamicLinks,
            localStorageRepository: mockLocalStorageRepository,
          ),
          act: (DynamicLinkBloc bloc) =>
              bloc.add(DeepLinkReceived(deepLink: fakeReferredDeepLink)),
          expect: [],
        );
      });
    });

    // todo blocv6migration: there is some overlap with the previous test, can probably refactor logic and test once
    group("on FirebaseDynamicLinks callbacks (onLink)", () {
      group("onSuccess", () {
        setUp(() {
          when(fakeData.link)
              .thenReturn(Uri.parse("https://fakelink.com/path/$fakeLessonId"));
        });

        blocTest(
            "should add DeepLinkReceived event with the correct uri, and emit MyDynamicLinkToNavigate on the correct path",
            build: () => DynamicLinkBloc(
                  dynamicLinks: mockFirebaseDynamicLinks,
                  localStorageRepository: mockLocalStorageRepository,
                ),
            act: (bloc) => (bloc as DynamicLinkBloc).onSuccessLink(fakeData),
            expect: [
              MyDynamicLinkToNavigate(path: "/path/$fakeLessonId"),
            ],
            verify: (bloc) {
              verify(fakeData.link);
            });
      });

      group("onError", () {
        blocTest("shoud emit DynamicLinkError",
            build: () => DynamicLinkBloc(
                  dynamicLinks: mockFirebaseDynamicLinks,
                  localStorageRepository: mockLocalStorageRepository,
                ),
            act: (bloc) => (bloc as DynamicLinkBloc)
                .onErrorLink(MockOnLinkErrorException()),
            expect: [
              DynamicLinkError(),
            ]);
      });
    });
  });
}
