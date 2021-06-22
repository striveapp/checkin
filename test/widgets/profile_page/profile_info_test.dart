import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/profile/bloc.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/ui/components/profile_page/image_with_grade.dart';
import 'package:checkin/src/ui/components/profile_page/profile_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:i18n_extension/i18n_extension.dart';
import 'package:mocktail/mocktail.dart';

import '../../pump_app.dart';

class MockProfileBloc extends MockBloc<ProfileEvent, ProfileState> implements ProfileBloc {}

class FakeProfileEvent extends Fake implements ProfileEvent {}

class FakeProfileState extends Fake implements ProfileState {}

void main() {
  group("ProfileInfo", () {
    ProfileBloc profileBloc;

    setUp(() {
      profileBloc = MockProfileBloc();
    });

    setUpAll(() {
      registerFallbackValue<ProfileEvent>(FakeProfileEvent());
      registerFallbackValue<ProfileState>(FakeProfileState());
    });

    tearDown(() {
      expect(Translations.missingKeys, isEmpty);
      expect(Translations.missingTranslations, isEmpty);
    });

    group("when profile is NOT loaded", () {
      testWidgets("Renders PlaceholderView", (tester) async {
        when(() => profileBloc.state).thenReturn(InitialProfileState());

        await tester.pumpAppWithScaffold(BlocProvider.value(
          value: profileBloc,
          child: ProfileInfo(),
        ));

        expect(find.byType(PlaceholderView), findsOneWidget);
      });
    });

    group("when profile is loaded", () {
      var baseUser = User(
        name: "tobuto",
        imageUrl: "test.png",
        email: "tobuto@nellano.it",
        isOwner: false,
        grade: Grade.blue,
      );
      testWidgets("renders ImageWithGrade and display name and belt", (tester) async {
        when(() => profileBloc.state).thenReturn(ProfileLoaded(
          profileUser: baseUser,
          isCurrentUser: false,
        ));

        await tester.pumpAppWithScaffold(
          BlocProvider.value(
            value: profileBloc,
            child: ProfileInfo(),
          ),
          locale: Locale("en", ""),
        );

        expect(find.byType(ImageWithGrade), findsOneWidget);
        expect(find.text("tobuto"), findsOneWidget);
        expect(find.text("Blue Belt"), findsOneWidget);
      });
    });
  });
}
