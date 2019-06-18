import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/resources/user_repository.dart';
import 'package:test/test.dart';
import 'package:mockito/mockito.dart';

class MockUserRepository extends Mock implements UserRepository {}
class MockAuthBloc extends Mock implements AuthBloc {}

void main() {
  group("UserBloc", () {
    UserBloc userBloc;
    UserRepository mockUserRepository;
    User testUser;
    AuthBloc mockAuthBloc;

    setUp(() {
      mockUserRepository = MockUserRepository();
      mockAuthBloc = MockAuthBloc();
      testUser = User(name: "Tobuto Nellano", email: "tobuto@nelano.com", imageUrl: "http://image.url");
      var authState = AuthAuthenticated(currentUserEmail: testUser.email, isFirstLogin: false);

      when(mockAuthBloc.state).thenAnswer((_) => Stream<AuthAuthenticated>.fromFuture(Future<AuthAuthenticated>.value(authState)));
      when(mockUserRepository.getUserByEmail(any))
          .thenAnswer((_) => Stream<User>.fromFuture(Future<User>.value(testUser)));
      userBloc = UserBloc(authBloc: mockAuthBloc, userRepository: mockUserRepository);
    });

    test('initial state is UserUninitialized', () {
      expect(userBloc.initialState, UserLoading());
    });

    group("dispatch Create", () {
      group("when success", () {
        test("should create a user", () async {
          final expectedState = [
            UserLoading(),
            UserSuccess(currentUser: testUser),
          ];

          when(mockUserRepository.createUser(testUser.name, testUser.email, testUser.imageUrl, testUser.counter,
                  testUser.rank, testUser.isOwner))
              .thenAnswer((_) => Future<User>.value(null));

          userBloc.dispatch(Create(user: testUser));

          await expectLater(
            userBloc.state,
            emitsInOrder(expectedState),
          );
        });
      });

      group("when error", () {
        test("should not create a user", () async {
          final expectedState = [
            UserLoading(),
            UserSuccess(currentUser: testUser),
            UserError(),
          ];

          when(mockUserRepository.createUser(testUser.name, testUser.email, testUser.imageUrl, testUser.counter,
                  testUser.rank, testUser.isOwner))
              .thenThrow(Exception("i don't wanna live in this world anymore"));

          userBloc.dispatch(Create(user: testUser));
          await expectLater(
            userBloc.state,
            emitsInOrder(expectedState),
          );
        });
      });
    });

    group("dispatch Update", () {
      var testGrade = "God";

      group("when success", () {
        test("should update a user", () async {
          final expectedState = [
            UserLoading(),
            UserSuccess(currentUser: testUser),
          ];

          when(mockUserRepository.updateUserGrade(testUser, testGrade))
              .thenAnswer((_) => Future<User>.value(null));

          userBloc.dispatch(Update(grade: testGrade));

          await expectLater(
            userBloc.state,
            emitsInOrder(expectedState),
          );
        });
      });

      group("when error", () {
        test("should not update a user", () async {
          final expectedState = [
            UserLoading(),
            UserSuccess(currentUser: testUser),
            UserError(),
          ];

          when(mockUserRepository.updateUserGrade(testUser, testGrade))
              .thenThrow(Exception("i don't wanna live in this planet anymore"));


          userBloc.dispatch(Update(grade: testGrade));

          await expectLater(
            userBloc.state,
            emitsInOrder(expectedState),
          );
        });
      });
    });
  });
}
