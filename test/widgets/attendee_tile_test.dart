@Skip("doesnt break anymore")
import 'package:checkin/src/models/attendee.dart';
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/repositories/graduation_system_repository.dart';
import 'package:checkin/src/resources/graduation_system_provider.dart';
import 'package:checkin/src/ui/components/registry/attendee_tile.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

import '../image_test_utils.dart';

// todo this seems to never fail
void main() {
  testWidgets("AttendeeTile should navigate to attendee's profile when tapped",
      (WidgetTester tester) async {
    provideMockedNetworkImages(() async {
      await tester.pumpWidget(await buildTestApplication(AttendeeTile(
        selectedGymId: "testGym",
        attendee: Attendee(
            name: "testAttendee",
            grade: Grade.white,
            imageUrl: "testImage",
            email: "testMail"),
      )));
      final tile = find.byKey(Key("tile-testMail"));

      expect(tile, findsOneWidget);

      await tester.tap(tile);
      await tester.pumpAndSettle();

      expect(find.text("Navigated!"), findsOneWidget);
    });
  });
}

Future<Widget> buildTestApplication(Widget testWidget) async {
  await Firebase.initializeApp();
  return RepositoryProvider<GraduationSystemRepository>(
    create: (context) => GraduationSystemProvider(),
    child: MaterialApp(
        routes: {
          'stats/testMail': (context) {
            return Scaffold(
              body: Text("Navigated!"),
            );
          }
        },
        home: Scaffold(
          body: testWidget,
        )),
  );
}
