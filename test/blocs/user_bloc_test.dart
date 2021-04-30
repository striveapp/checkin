import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/auth/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
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
  });
}
