import 'package:mockito/mockito.dart';

/// Throw every time that a mock method is called without a stub being matched:
void configureThrowOnMissingStub(List<Mock> mocks){
  mocks.forEach((mock) {
    throwOnMissingStub(mock);
  });
}

/// Logs all invocations and checks if any of given mocks has any unverified interaction.
/// We can use this method after calling verify() methods. It is to make sure that no interaction is left for verification.
void logAndVerifyNoMoreInteractions(List<Mock> mocks) {
  logInvocations(mocks);
  _verifyNoMoreInteractions(mocks);
}


void _verifyNoMoreInteractions(List<Mock> mocks){
  mocks.forEach((mock) {
    verifyNoMoreInteractions(mock);
  });
}

void resetMocks(List<Mock> mocks) {
  mocks.forEach((mock) {
    reset(mock);
  });
}