import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'helper/mocktail_helper.dart';

class MockUserRepository extends Mock implements UserRepository {}

class MockAuthBloc extends MockBloc<AuthEvent, AuthState> implements AuthBloc {}

class FakeAuthEvent extends Fake implements AuthEvent {}

class FakeAuthState extends Fake implements AuthState {}

void main() {
  setUpAll(() {
    registerFallbackValue<AuthState>(FakeAuthState());
    registerFallbackValue<AuthEvent>(FakeAuthEvent());
  });

  group("UserBloc", () {
    MockUserRepository mockUserRepository;
    AuthBloc mockAuthBloc;
    User testUser = User(
        name: "Tobuto Nellano",
        email: "tobuto@nelano.com",
        imageUrl: "http://image.url",
        selectedGymId: "fake gym");

    setUp(() {
      mockUserRepository = MockUserRepository();
      mockAuthBloc = MockAuthBloc();

      configureThrowOnMissingStub([
        mockUserRepository,
      ]);
    });

    tearDown(() {
      logAndVerifyNoMoreInteractions([
        mockUserRepository,
      ]);
    });

    // todo missing initial state test
    group("on UserUpdated event", () {
      setUp(() {
        whenListen(mockAuthBloc, Stream.fromIterable([AuthAuthenticated(loggedUser: testUser)]));
      });

      group("when user is not null", () {
        setUp(() {
          when(() => mockUserRepository.getUserByEmail(testUser.email)).thenAnswer((_) {
            return Stream<User>.fromFuture(Future.value(testUser));
          });
        });

        tearDown(() async {
          verify(() => mockUserRepository.getUserByEmail(testUser.email));
        });

        blocTest(
          "should emit UserSuccess",
          build: () => UserBloc(
            authBloc: mockAuthBloc,
            userRepository: mockUserRepository,
          ),
          expect: () => [UserSuccess(currentUser: testUser)],
        );
      });

      group("when user is null", () {
        setUp(() {
          when(() => mockUserRepository.getUserByEmail(testUser.email)).thenAnswer((_) {
            return Stream<User>.fromFuture(Future.value(null));
          });
        });

        tearDown(() {
          verify(() => mockUserRepository.getUserByEmail(testUser.email));
        });

        blocTest(
          "should emit UserError",
          build: () => UserBloc(
            authBloc: mockAuthBloc,
            userRepository: mockUserRepository,
          ),
          expect: () => [UserError()],
        );
      });
    });

    group("on UpdateGrade event", () {
      setUp(() async {
        when(() => mockUserRepository.updateGrade(testUser.email, Grade.black)).thenAnswer((_) {
          return Future.value(null);
        });
      });

      tearDown(() async {
        await untilCalled(() => mockUserRepository.updateGrade(testUser.email, Grade.black));
        verify(() => mockUserRepository.updateGrade(testUser.email, Grade.black));
      });

      blocTest("should update the user grade",
          build: () => UserBloc(
                authBloc: mockAuthBloc,
                userRepository: mockUserRepository,
              ),
          seed: () => UserState.userSuccess(currentUser: testUser),
          act: (bloc) => bloc.add(UpdateGrade(newGrade: Grade.black)),
          expect: () => []);
    });

    group("on UpdateSelectedGym event", () {
      var newSelectedGymId = "testGym";

      setUp(() {
        when(() => mockUserRepository.updateSelectedGymId(testUser.email, newSelectedGymId))
            .thenAnswer((_) {
          return Future.value(null);
        });
      });

      tearDown(() async {
        await untilCalled(
            () => mockUserRepository.updateSelectedGymId(testUser.email, newSelectedGymId));
        verify(() => mockUserRepository.updateSelectedGymId(testUser.email, newSelectedGymId));
      });

      blocTest("should update the user selected gym",
          build: () => UserBloc(
                authBloc: mockAuthBloc,
                userRepository: mockUserRepository,
              ),
          seed: () => UserState.userSuccess(currentUser: testUser),
          act: (bloc) => bloc.add(UserEvent.updateSelectedGym(newGymId: newSelectedGymId)),
          expect: () => []);
    });
  });
}
