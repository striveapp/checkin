import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/account/bloc.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'helper/mock_helper.dart';

class MockAnalyticsRepository extends Mock implements AnalyticsRepository {}

class MockUserRepository extends Mock implements UserRepository {}

void main() {
  group("AccountBloc", () {
    MockAnalyticsRepository mockAnalyticsRepository;
    MockUserRepository mockUserRepository;

    final User fakeUser = User(
      name: "Tobuto nellano",
      email: "tobuto@nellano.com",
      imageUrl: "nope",
    );

    setUp(() {
      mockAnalyticsRepository = MockAnalyticsRepository();
      mockUserRepository = MockUserRepository();
      configureThrowOnMissingStub([
        mockAnalyticsRepository,
        mockUserRepository,
      ]);
    });

    tearDown(() {
      logAndVerifyNoMoreInteractions([
        mockAnalyticsRepository,
        mockUserRepository,
      ]);
    });

    group("initial state", () {
      setUp(() {
        when(mockUserRepository.getUser()).thenAnswer((realInvocation) => Stream.empty());
      });

      tearDown(() async {
        await untilCalled(mockUserRepository.getUser());
        verify(mockUserRepository.getUser());
      });

      blocTest(
        "is AccountInitial",
        build: () => AccountBloc(
          userRepository: mockUserRepository,
          analyticsRepository: mockAnalyticsRepository,
        ),
        expect: [],
        verify: (bloc) {
          expect(bloc.state, AccountInitial());
        },
      );
    });

    group("on AccountUpdated event", () {
      setUp(() {
        when(mockUserRepository.getUser()).thenAnswer((realInvocation) => Stream.value(fakeUser));
      });

      tearDown(() {
        verify(mockUserRepository.getUser());
      });

      blocTest("should emit AccountLoaded passing the user informations",
          build: () => AccountBloc(
                analyticsRepository: mockAnalyticsRepository,
                userRepository: mockUserRepository,
              ),
          expect: [
            AccountLoaded(user: fakeUser),
          ]);
    });

    group("on AccountDisplayError event", () {
      final errorMessage = "Boom!";

      setUp(() {
        when(mockUserRepository.getUser()).thenAnswer((realInvocation) => Stream.value(fakeUser));
        when(mockAnalyticsRepository.setupBankAccountError(error: errorMessage))
            .thenAnswer((_) => Future.value(null));
      });

      tearDown(() {
        verify(mockUserRepository.getUser());
        verify(mockAnalyticsRepository.setupBankAccountError(error: errorMessage));
      });

      blocTest(
        "should track the error and emit AccountError",
        build: () => AccountBloc(
          analyticsRepository: mockAnalyticsRepository,
          userRepository: mockUserRepository,
        ),
        act: (bloc) => bloc.add(AccountDisplayError(errorMessage: errorMessage)),
        expect: [
          AccountError(errorMessage: errorMessage),
          AccountLoaded(user: fakeUser),
        ],
      );
    });
  });
}
