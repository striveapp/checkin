import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/account/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/analytics_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockUserBloc extends Mock implements UserBloc {}
class MockAnalyticsRepository extends Mock implements AnalyticsRepository {}

void main() {
  group("AccountBloc", () {
    AccountBloc accountBloc;
    MockUserBloc mockUserBloc;
    final User fakeUser = User(
        name: "Tobuto nellano", email: "tobuto@nellano.com", imageUrl: "nope");

    tearDown(() {
      accountBloc?.close();
      mockUserBloc?.close();
    });

    group("initial state", () {
      test("initial state is AccountInitial", () {
        mockUserBloc = MockUserBloc();
        accountBloc = AccountBloc(userBloc: mockUserBloc, analyticsRepository: MockAnalyticsRepository());
        expect(accountBloc.initialState, AccountInitial());
      });
    });

    group("AccountUpdated", () {
      test("should emits AccountLoaded and passing the user informations", () {
        mockUserBloc = MockUserBloc();
        accountBloc = AccountBloc(userBloc: mockUserBloc, analyticsRepository: MockAnalyticsRepository());

        accountBloc.add(AccountUpdated(user: fakeUser));

        final expectedState = [
          AccountInitial(),
          AccountLoaded(user: fakeUser),
        ];

        expectLater(
          accountBloc,
          emitsInOrder(expectedState),
        );
      });

      test("should emits AccountLoaded with current user informations", () {
        mockUserBloc = MockUserBloc();
        whenListen(mockUserBloc, Stream.value(UserSuccess(currentUser: fakeUser)));
        accountBloc = AccountBloc(userBloc: mockUserBloc, analyticsRepository: MockAnalyticsRepository());

        final expectedState = [
          AccountInitial(),
          AccountLoaded(user: fakeUser),
        ];

        expectLater(
          accountBloc,
          emitsInOrder(expectedState),
        );
      });
    });
  });
}
