import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/account/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'helper/mock_helper.dart';

class MockUserBloc extends MockBloc<UserState> implements UserBloc {}
class MockAnalyticsRepository extends Mock implements AnalyticsRepository {}

void main() {

  group("AccountBloc", () {
    MockUserBloc mockUserBloc;
    MockAnalyticsRepository mockAnalyticsRepository;

    final User fakeUser = User(
      name: "Tobuto nellano",
      email: "tobuto@nellano.com",
      imageUrl: "nope",
    );

    setUp(() {
      mockUserBloc = MockUserBloc();
      mockAnalyticsRepository = MockAnalyticsRepository();
      configureThrowOnMissingStub([mockAnalyticsRepository]);
    });

    tearDown((){
      logAndVerifyNoMoreInteractions([mockAnalyticsRepository]);
    });

    group("initial state", () {
      AccountBloc accountBloc;

      setUp((){
        accountBloc =
            AccountBloc(userBloc: mockUserBloc, analyticsRepository: mockAnalyticsRepository);
      });

      tearDown((){
        accountBloc?.close();
      });

      test("is AccountInitial", () {
        expect(accountBloc.state, AccountInitial());
      });
    });

    group("on AccountUpdated event", () {
      setUp(() {
        whenListen(
          mockUserBloc,
          Stream.fromIterable([UserSuccess(currentUser: fakeUser)]),
        );
      });

      blocTest("should emit AccountLoaded passing the user informations",
          build: () =>
              AccountBloc(userBloc: mockUserBloc, analyticsRepository: mockAnalyticsRepository),
          expect: [
            AccountLoaded(user: fakeUser),
          ]);
    });

    group("on AccountDisplayError event", () {
      final errorMessage = "Boom!";

      setUp(() {
        when(mockAnalyticsRepository.setupBankAccountError(error: errorMessage))
            .thenAnswer((_) => Future.value(null));
      });

      tearDown(() {
        verify(mockAnalyticsRepository.setupBankAccountError(error: errorMessage));
      });

      blocTest(
        "should track the error and emit AccountError",
        build: () =>
            AccountBloc(userBloc: mockUserBloc, analyticsRepository: mockAnalyticsRepository),
        act: (bloc) => bloc.add(AccountDisplayError(errorMessage: errorMessage)),
        expect: [
          AccountError(errorMessage: errorMessage),
        ],
      );
    });
  });
}
