import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/account/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/user.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockUserBloc extends Mock implements UserBloc {}
//class MockUser extends Mock implements User {}

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
        accountBloc = AccountBloc(userBloc: mockUserBloc);
        expect(accountBloc.initialState, AccountInitial());
      });
    });


    group("AccountUpdated", () {
      test("should emits AccountLoaded and passing the user informations", () {
        mockUserBloc = MockUserBloc();
        accountBloc = AccountBloc(userBloc: mockUserBloc);

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
        accountBloc = AccountBloc(userBloc: mockUserBloc);

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
