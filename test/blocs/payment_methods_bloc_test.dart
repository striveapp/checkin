import 'package:bloc_test/bloc_test.dart';
import 'package:checkin/src/api/payment_api.dart';
import 'package:checkin/src/blocs/payment_methods/bloc.dart';
import 'package:checkin/src/blocs/user/bloc.dart';
import 'package:checkin/src/models/gym.dart';
import 'package:checkin/src/models/payment_method.dart';
import 'package:checkin/src/models/user.dart';
import 'package:checkin/src/repositories/payment_method_repository.dart';
import 'package:checkin/src/util/url_launcher_util.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

class MockPaymentApi extends Mock implements PaymentApi {}

class MockPaymentMethodRepository extends Mock
    implements PaymentMethodRepository {}

class MockUrlLauncherUtil extends Mock implements UrlLauncherUtil {}

class MockUserBloc extends Mock implements UserBloc {}

void main() {
  MockPaymentApi mockPaymentApi = MockPaymentApi();
  MockPaymentMethodRepository mockPaymentMethodRepository =
      MockPaymentMethodRepository();
  MockUrlLauncherUtil mockUrlLauncherUtil = MockUrlLauncherUtil();
  MockUserBloc mockUserBloc = MockUserBloc();
  PaymentMethodsBloc paymentMethodsBloc;

  String fakeEmail = "test@test.com";
  PaymentMethod fakePaymentMethod = PaymentMethod(
    customerId: "cus_123",
    lastFourDigits: "1234",
    billingEmail: fakeEmail,
    country: "ES",
  );
  String fakeGymId = "testGym";
  Gym testGym = Gym(
      id: fakeGymId,
      paymentAppDomain: "test-app",
      stripePublicKey: "test_key",
      host: "da_host");
  Gym prodGym = Gym(
      id: "prodGym",
      paymentAppDomain: "prod-app",
      stripePublicKey: "prod_key",
      host: "da_host");

  User fakeUser = User(email: fakeEmail, name: "Test", imageUrl: "test", selectedGymId: fakeGymId);
  User prodUser = User(email: "prod@email.com", name: "ProdUser", imageUrl: "test", selectedGymId: "prodGym");

  group("PaymentMethodBloc", () {
    group("PaymentMethodUpdated", () {
      group("when there are no payment methods", () {
        setUp(() {
          whenListen(mockUserBloc,
              Stream.fromIterable([UserSuccess(currentUser: fakeUser)]));
          when(mockPaymentMethodRepository.getPaymentMethod(
                  gymId: testGym.id, email: fakeEmail))
              .thenAnswer((realInvocation) {
            return Stream.value(null);
          });
          paymentMethodsBloc = PaymentMethodsBloc(
              userBloc: mockUserBloc,
              paymentApi: mockPaymentApi,
              paymentMethodRepository: mockPaymentMethodRepository,
              urlLauncherUtil: mockUrlLauncherUtil);
        });

        tearDown(() {
          paymentMethodsBloc.close();
        });

        test("should emit PaymentMethodEmpty", () async {
          final expectedState = [
            InitialPaymentMethodsState(),
            PaymentMethodEmpty(customerEmail: fakeUser.email),
          ];

          await expectLater(
            paymentMethodsBloc,
            emitsInOrder(expectedState),
          );
          logInvocations([mockPaymentMethodRepository]);

          verify(mockPaymentMethodRepository.getPaymentMethod(
              gymId: fakeUser.selectedGymId, email: fakeUser.email));
        });
      });
      group("when there are payment methods", () {
        setUp(() {
          whenListen(mockUserBloc,
              Stream.fromIterable([UserSuccess(currentUser: fakeUser)]));
          when(mockPaymentMethodRepository.getPaymentMethod(
                  gymId: fakeGymId, email: fakeEmail))
              .thenAnswer((realInvocation) {
            return Stream.value(fakePaymentMethod);
          });
          paymentMethodsBloc = PaymentMethodsBloc(
              userBloc: mockUserBloc,
              paymentApi: mockPaymentApi,
              paymentMethodRepository: mockPaymentMethodRepository,
              urlLauncherUtil: mockUrlLauncherUtil);
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
    group("RegisterBankAccount", () {
      group("when calling dev endpoint", () {
        setUp(() {
          whenListen(mockUserBloc,
              Stream.fromIterable([UserSuccess(currentUser: fakeUser)]));
          when(mockPaymentMethodRepository.getPaymentMethod(
                  gymId: fakeGymId, email: fakeEmail))
              .thenAnswer((realInvocation) {
            return Stream.value(null);
          });
          when(mockPaymentApi.setupIntent(
                  gymId: fakeGymId, customerEmail: fakeEmail))
              .thenAnswer((realInvocation) {
            return Future.value("some_secret");
          });

          paymentMethodsBloc = PaymentMethodsBloc(
              userBloc: mockUserBloc,
              paymentApi: mockPaymentApi,
              paymentMethodRepository: mockPaymentMethodRepository,
              urlLauncherUtil: mockUrlLauncherUtil);

          paymentMethodsBloc.add(RegisterBankAccount(gym: testGym, billingEmail: fakeUser.email));
        });


        test(
            "should call the payment api to setup intent of register a payment method",
            () async {
          final expectedState = [
            InitialPaymentMethodsState(),
            PaymentMethodEmpty(customerEmail: fakeUser.email),
            PaymentMethodLoading()
          ];

          await expectLater(
            paymentMethodsBloc,
            emitsInAnyOrder(expectedState),
          );

          logInvocations([mockPaymentApi, mockUrlLauncherUtil]);

          verify(mockPaymentApi.setupIntent(
              customerEmail: fakeEmail, gymId: fakeGymId));
          verify(mockUrlLauncherUtil.launchUrl(argThat(startsWith("https://${testGym.paymentAppDomain}?pk=${testGym.stripePublicKey}&customerEmail=test@test.com&cs=some_secret"))));
            });
      });
      group("when calling prod endpoint", () {
        setUp(() {
          whenListen(mockUserBloc,
              Stream.fromIterable([UserSuccess(currentUser: prodUser)]));
          when(mockPaymentMethodRepository.getPaymentMethod(
                  gymId: "prodGym", email: prodUser.email))
              .thenAnswer((realInvocation) {
            return Stream.value(null);
          });
          when(mockPaymentApi.setupIntent(
                  gymId: "prodGym", customerEmail: prodUser.email))
              .thenAnswer((realInvocation) {
            return Future.value("prod_secret");
          });

          paymentMethodsBloc = PaymentMethodsBloc(
              userBloc: mockUserBloc,
              paymentApi: mockPaymentApi,
              paymentMethodRepository: mockPaymentMethodRepository,
              urlLauncherUtil: mockUrlLauncherUtil);
          throwOnMissingStub(mockPaymentApi);
          throwOnMissingStub(mockPaymentMethodRepository);

          paymentMethodsBloc.add(RegisterBankAccount(gym: prodGym, billingEmail: prodUser.email));
        });

        tearDown(() {
          paymentMethodsBloc.close();
        });
        test(
            "should call the payment api to setup intent of register a payment method",
            () async {
          final expectedState = [
            InitialPaymentMethodsState(),
            PaymentMethodEmpty(customerEmail: prodUser.email),
            PaymentMethodLoading()
          ];

          await expectLater(
            paymentMethodsBloc,
            emitsInAnyOrder(expectedState),
          );

          logInvocations([mockPaymentApi, mockUrlLauncherUtil]);

          verify(mockPaymentApi.setupIntent(
              customerEmail: prodUser.email, gymId: "prodGym"));
          verify(mockUrlLauncherUtil.launchUrl(argThat(startsWith("https://prod-app?pk=prod_key&customerEmail=prod@email.com&cs=prod_secret"))));
        });
      });
    });
    group("ChangeBankAccount", () {
      group("when calling dev endpoint", () {
        setUp(() {
          whenListen(mockUserBloc,
              Stream.fromIterable([UserSuccess(currentUser: fakeUser)]));
          when(mockPaymentMethodRepository.getPaymentMethod(
              gymId: fakeGymId, email: fakeEmail))
              .thenAnswer((realInvocation) {
            return Stream.value(fakePaymentMethod);
          });
          when(mockPaymentApi.setupIntent(
              gymId: fakeGymId, customerEmail: fakeEmail, customerId: "cus_123"))
              .thenAnswer((realInvocation) {
            return Future.value("some_secret");
          });

          paymentMethodsBloc = PaymentMethodsBloc(
              userBloc: mockUserBloc,
              paymentApi: mockPaymentApi,
              paymentMethodRepository: mockPaymentMethodRepository,
              urlLauncherUtil: mockUrlLauncherUtil);

          paymentMethodsBloc.add(ChangeBankAccount(gym: testGym, billingEmail: fakeUser.email, customerId: "cus_123"));
        });


        test(
            "should call the payment api to setup intent of register a payment method",
                () async {
              final expectedState = [
                InitialPaymentMethodsState(),
                PaymentMethodLoaded(paymentMethod: fakePaymentMethod),
                PaymentMethodLoading()
              ];

              await expectLater(
                paymentMethodsBloc,
                emitsInAnyOrder(expectedState),
              );

              logInvocations([mockPaymentApi, mockUrlLauncherUtil]);

              verify(mockPaymentApi.setupIntent(
                  customerEmail: fakeEmail, gymId: fakeGymId, customerId: "cus_123"));
              verify(mockUrlLauncherUtil.launchUrl(argThat(startsWith("https://${testGym.paymentAppDomain}?pk=${testGym.stripePublicKey}&customerEmail=test@test.com&cs=some_secret"))));
            });
      });
    });
  });
}
