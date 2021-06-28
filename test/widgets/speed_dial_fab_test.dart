// @dart=2.9

import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/blocs/lessons/bloc.dart';
import 'package:checkin/src/ui/components/empty_widget.dart';
import 'package:checkin/src/ui/components/lessons/speed_dial_fab/speed_dial_fab.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../pump_app.dart';

class MockLessonsBloc extends MockBloc<LessonsEvent, LessonsState> implements LessonsBloc {}

class FakeLessonsEvent extends Fake implements LessonsEvent {}

class FakeLessonsState extends Fake implements LessonsState {}

// examples: https://github.com/felangel/fluttersaurus/blob/master/test/search/view/search_form_test.dart
void main() {
  setUpAll(() {
    registerFallbackValue<LessonsEvent>(FakeLessonsEvent());
    registerFallbackValue<LessonsState>(FakeLessonsState());
  });

  group("SpeedDialFab", () {
    LessonsBloc lessonsBloc;

    setUp(() {
      lessonsBloc = MockLessonsBloc();
    });

    testWidgets("Renders EmptyWidget when lesson state is not LessonsLoaded", (tester) async {
      when(() => lessonsBloc.state).thenReturn(LessonsUninitialized());

      await tester.pumpApp(BlocProvider.value(value: lessonsBloc, child: SpeedDialFab()));

      expect(find.byType(EmptyWidget), findsOneWidget);
    });
  });
}
