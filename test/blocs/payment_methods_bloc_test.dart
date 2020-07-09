import 'package:checkin/src/api/payment_api.dart';
import 'package:checkin/src/blocs/payment_methods/bloc.dart';
import 'package:checkin/src/models/payment_method.dart';
import 'package:checkin/src/repositories/payment_method_repository.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockPaymentApi extends Mock implements PaymentApi {}
class MockPaymentMethodRepository extends Mock implements PaymentMethodRepository {}

void main() {
  MockPaymentApi mockPaymentApi = MockPaymentApi();
  MockPaymentMethodRepository mockPaymentMethodRepository = MockPaymentMethodRepository();
  PaymentMethodsBloc paymentMethodsBloc;

  PaymentMethod fakePaymentMethod = PaymentMethod(
    lastFourDigits: 1234,
    billingEmail: "test@test.com",
    country: "ES",
  );

  group("PaymentMethodBloc", () {
    group("PaymentMethodUpdated", () {
      group("when there are no payment methods", () {
        setUp(() {
          when(mockPaymentMethodRepository.getPaymentMethod(gymId: "test", email: "test@test.com")).thenAnswer((realInvocation) {
            return Stream.value(null);
          });
          paymentMethodsBloc = PaymentMethodsBloc(paymentApi: mockPaymentApi, paymentMethodRepository: mockPaymentMethodRepository);
        });

        tearDown(() {
          paymentMethodsBloc.close();
        });

        test("should emit PaymentMethodEmpty",
                () async {
              final expectedState = [
                InitialPaymentMethodsState(),
                PaymentMethodEmpty(),
              ];

              await expectLater(
                paymentMethodsBloc,
                emitsInOrder(expectedState),
              );
              verify(mockPaymentMethodRepository.getPaymentMethod(gymId: "test", email: "test@test.com"));
            });
      });

      group("when there are payment methods", () {
        setUp(() {
          when(mockPaymentMethodRepository.getPaymentMethod(gymId: "test", email: "test@test.com")).thenAnswer((realInvocation) {
            return Stream.value(fakePaymentMethod);
          });
          paymentMethodsBloc = PaymentMethodsBloc(paymentApi: mockPaymentApi, paymentMethodRepository: mockPaymentMethodRepository);
        });

        tearDown(() {
          paymentMethodsBloc.close();
        });
        test("should emit PaymentMethodLoaded with the default payment method",
            () {
          final expectedState = [
            InitialPaymentMethodsState(),
            PaymentMethodLoaded(paymentMethod: fakePaymentMethod),
          ];

          expectLater(
            paymentMethodsBloc,
            emitsInOrder(expectedState),
          );
        });
      });
    });

//    group("RegisterBankAccount", () {

//
//      test("should emit PaymentMethod with logged user", () async {
//        final expectedResponse = [
//          InitialPaymentMethodsState(),
//          AuthAuthenticated(loggedUser: fakeUser),
//        ];
//
//        await expectLater(authBloc, emitsInOrder(expectedResponse));
//        verify(mockAnalyticsRepository.setUserProperties(fakeUser.uid));
//      });
//    });
  });
}
