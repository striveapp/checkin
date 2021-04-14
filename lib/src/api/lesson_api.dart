import 'package:checkin/src/logging/logger.dart';

import 'api.dart';

class LessonApi {
  Future<void> acceptAll(String gymId, String lessonId, String lessonDate) async {
    var parameters = {'lessonId': lessonId, 'lessonDate': lessonDate, 'gymId': gymId};

    await Api.call(
      functionName: "acceptAll",
      parameters: parameters,
    ).then((_) {
      Logger.log.i("User accepted from lesson with id [$lessonDate,$lessonId]");
    }).catchError((e, st) {
      Logger.log.e("An error occurred when calling acceptAll", e, st);
    });
  }

  Future<void> cleanUpTestGym() async {
    await Api.call(
      functionName: "cleanTestGym",
    ).then((_) {
      Logger.log.i("Test gym cleaned up");
    }).catchError((e, st) {
      Logger.log.e("An error occurred when calling cleanUpTestGym", e, st);
    });
  }
}
