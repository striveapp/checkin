import 'package:checkin/src/blocs/login/bloc.dart';
import 'package:checkin/src/constants.dart' as constants;
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/ui/components/account/payment.dart';
import 'package:checkin/src/ui/components/apple_sign_in_button.dart';
import 'package:checkin/src/ui/components/gym_selection/gym_selection_buttons.dart';
import 'package:checkin/src/ui/components/payment_methods/active_payment_method.dart';
import 'package:checkin/src/ui/components/payment_methods/empty_payment_method.dart';
import 'package:checkin/src/ui/components/plans/plans_callout.dart';
import 'package:checkin/src/ui/components/plans/plans_footer.dart';
import 'package:checkin/src/ui/components/plans/plans_list.dart';
import 'package:checkin/src/ui/components/plans/price/price_footer.dart';
import 'package:checkin/src/ui/components/registry/attendee_tile.dart';
import 'package:checkin/src/ui/components/registry/register_dialog.dart';
import 'package:checkin/src/ui/components/registry/registry_counter.dart';
import 'package:checkin/src/ui/components/attendees_preview.dart';
import 'package:checkin/src/ui/components/google_sign_in_button.dart';
import 'package:checkin/src/ui/components/grade_card.dart';
import 'package:checkin/src/ui/components/leaderboard/no_leaderboard_banner.dart';
import 'package:checkin/src/ui/components/registry/empty_registry.dart';
import 'package:checkin/src/ui/components/registry/lesson_infos.dart';
import 'package:checkin/src/ui/components/membership/active_membership.dart';
import 'package:checkin/src/ui/components/membership/inactive_membership.dart';
import 'package:checkin/src/ui/components/membership/unsubscribe_dialog.dart';
import 'package:checkin/src/ui/components/no_lessons_banner.dart';
import 'package:checkin/src/ui/components/profile_card.dart';
import 'package:checkin/src/ui/components/profile_infos.dart';
import 'package:checkin/src/ui/components/registry/registry_controls.dart';
import 'package:checkin/src/ui/components/stats/graduate_dialog.dart';
import 'package:checkin/src/ui/components/stats/graduate_fab.dart';
import 'package:checkin/src/ui/components/stats/lessons/attendees_counter.dart';
import 'package:checkin/src/ui/components/stats/user/attended_lessons_list.dart';
import 'package:checkin/src/ui/components/stats/user/mat_time_counter.dart';
import 'package:checkin/src/ui/components/upgrader_dialog.dart';
import 'package:checkin/src/ui/pages/account_page.dart';
import 'package:checkin/src/ui/pages/grade_page.dart';
import 'package:checkin/src/ui/pages/gym_selection_page.dart';
import 'package:checkin/src/ui/pages/leaderboard_page.dart';
import 'package:checkin/src/ui/pages/lessons_page.dart';
import 'package:checkin/src/ui/pages/lessons_stats_page.dart';
import 'package:checkin/src/ui/pages/payment_success_page.dart';
import 'package:checkin/src/ui/pages/plans_page.dart';
import 'package:checkin/src/ui/pages/registry_page.dart';
import 'package:checkin/src/ui/pages/stats_page.dart';
import 'package:checkin/src/ui/pages/sub_plan_page.dart';
import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  // ignore: unused_field
  static var _t = Translations('en') + {
    'en': LessonsPage.classes,
    'es': "Clases",
  } + {
    'en': GradePage.selectYourBelt,
    'es': '¿Cuál es tu cinturón?',
  } + {
    'en': RegistryPage.registry,
    'es': 'Registro',
  } + {
    'en': StatsPage.stats,
    'es': 'Estadísticas',
  } + {
    'en': constants.WEEK,
    'es': 'semana',
  } + {
    'en': constants.MONTH,
    'es': 'mes',
  } + {
    'en': constants.YEAR,
    'es': 'año',
  } + {
    //TODO: this might be removed
    'en': constants.by,
    'es': 'Por',
  } + {
    'en': EmptyRegistry.emptyClass,
    'es': 'Nadie en clase todavía',
  } + {
    'en': AttendedLessonsList.attendedClasses,
    'es': 'Clases atendidas',
  } + {
    'en': MatTimeCounter.matTime,
    'es': 'Horas de Mat',
  } + {
    'en': MatTimeCounter.numHours
        .zero('0 hours')
        .one('1 hour')
        .many('%d hours'),
    'es': '%d horas'
        .zero('0 horas')
        .one('1 hora')
        .many('%d horas'),
  } + {
    'en': MatTimeCounter.hours
        .zero('hours')
        .one('hour')
        .many('hours'),
    'es': 'horas'
        .zero('horas')
        .one('hora')
        .many('horas'),
  } + {
    'en': MatTimeCounter.attendedClasses
        .zero('No classes attended')
        .one('You attended one class')
        .many('You attended %d classes'),
    'es': 'Has atendido %d clases'
        .zero('No has atendido ninguna clase')
        .one('Has atendido una clase')
        .many('Has atendido %d clases'),
  } + {
    'en': MatTimeCounter.thisTimespan
        .modifier(constants.WEEK, 'this week')
        .modifier(constants.MONTH, 'this month')
        .modifier(constants.YEAR, 'this year'),
    'es': 'este %s'
        .modifier(constants.WEEK, 'esta semana')
        .modifier(constants.MONTH, 'este mes')
        .modifier(constants.YEAR, 'este año'),
  } + {
    'en': RegistryCounter.full,
    'es': 'completo',
  }  + {
    'en': RegistryCounter.attendees,
    'es': 'Participantes',
  } + {
    'en': AttendeeTile.you,
    'es': 'Tú',
  } + {
    'en': AttendeeTile.youHaveNoMoreAvailableSessions,
    'es': 'No tienes más sesiones disponibles',
  } +{
    'en': AttendeeTile.thisStudentIsInSessionOverdue,
    'es': 'Este estudiante ya no tienes sesiones disponibles',
  } + {
    'en': LessonInfos.and,
    'es': 'y',
  } + {
    'en': AttendeesPreview.andOthers
        .one('and another one')
        .many('and %d others'),
    'es': 'y %d más'
        .one('y uno más')
        .many('y %d más'),
  } + {
    'en': NoLessonsBanner.noClasses,
    'es': 'No hay clases hoy',
  } + {
    'en': Grade.white.name,
    'es': 'Blanco',
  } + {
    'en': Grade.blue.name,
    'es': 'Azul',
  } + {
    'en': Grade.purple.name,
    'es': 'Morado',
  } + {
    'en': Grade.brown.name,
    'es': 'Marrón',
  } + {
    'en': Grade.black.name,
    'es': 'Negro',
  } + {
    'en': Grade.white.description,
    'es': 'Construyendo las bases',
  } + {
    'en': Grade.blue.description,
    'es': 'Desarrollo de la habilidad técnica',
  } + {
    'en': Grade.purple.description,
    'es': 'Desarrollo del juego y experimentación',
  } + {
    'en': Grade.brown.description,
    'es': 'Pensar conceptualmente y fortalecer las debilidades',
  } + {
    'en': Grade.black.description,
    'es': 'Comenzar de nuevo, enseñar y reflexionar',
  } + {
    'en': RegistryControls.unregisterClass,
    'es': 'Desapuntarse de la clase',
  } + {
    'en': RegistryControls.registerClass,
    'es': 'Apuntarse a la clase',
  } + {
    'en': RegistryControls.registryFull,
    'es': 'Clase completa',
  } + {
    'en': RegistryControls.acceptAll,
    'es': 'Aceptar todos',
  } + {
    'en': RegisterDialog.cancel,
    'es': 'Cancelar',
  } + {
    'en': RegisterDialog.continueAnyway,
    'es': 'Registrame igualmente',
  } + {
    'en': RegisterDialog.userFinishedAvailableSessions,
    'es': 'Ya has usado todas las sesiones disponibles',
  } + {
    'en': GoogleSignInButton.googleSignIn,
    'es': 'Acceso con Google',
  } + {
    'en': AppleSignInButton.appleSignIn,
    'es': 'Acceso con Apple',
  } + {
    'en': AccountPage.account,
    'es': 'Cuenta',
  } + {
    'en': Payment.membership,
    'es': 'Afiliación',
  } + {
    'en': Payment.paymentMethods,
    'es': 'Metodos de pago',
  } + {
    'en': AccountPage.profile,
    'es': 'Perfil',
  } + {
    'en': PaymentSuccessPage.paymentSuccessful,
    'es': 'Pagado con éxito',
  } + {
    'en': PaymentSuccessPage.goToAccount,
    'es': 'Volver a la cuenta',
  } + {
    'en': PaymentSuccessPage.disclaimerSubscription30Min,
    'es': 'Tu subscripción puede tardar hasta 30 minutos en aparecer en tu cuenta',
  } + {
    'en': ActiveMembershipView.unsubscribe,
    'es': 'Darse de baja',
  } + {
    'en': ActiveMembershipView.nextBilling,
    'es': 'El siguiente pago es el',
  } + {
    'en': ActiveMembershipView.yourSubscription,
    'es': 'Tu subscripción',
  } + {
    'en': ActiveMembershipView.remainingSessions,
    'es': 'Sesiones restantes',
  } + {
    'en': ProfileCard.enterYourName,
    'es': 'Escribe tu nombre',
  } + {
    'en': InactiveMembershipView.chooseYourSubscription,
    'es': 'Escoje tu subscripción',
  } + {
    'en': InactiveMembershipView.notActiveSubscription,
    'es': 'Tu subscripción no está activa todavía',
  } + {
    'en': UnsubscribeDialog.unsubscribe,
    'es': 'Darse de baja',
  } + {
    'en': UnsubscribeDialog.aboutToPermanentlyDeleteSubscription,
    'es': 'Estás a punto de cancelar tu cuota de forma permanente',
  } + {
    'en': UnsubscribeDialog.cannotBeUndone,
    'es': 'Esta operación no se puede deshacer',
  } + {
    'en': UnsubscribeDialog.keepSubscription,
    'es': 'Mantener subscripción',
  } + {
    'en': GradeCard.beltColor,
    'es': 'Cinturón %s'
  } + {
    'en': ProfileInfos.beltColor,
    'es': 'Cinturón %s'
  } + {
    'en': ProfileInfos.beltColor,
    'es': 'Cinturón %s'
  } + {
    'en': UpgraderDialog.update,
    'es': 'Actualizar'
  } + {
    'en': UpgraderDialog.versionNotSupported,
    'es': 'La versión actual de esta aplicación ya no es compatible\n\nPor favor, actualízala'
  } + {
    'en': NoLeaderboardBanner.noLeaderboard,
    'es': 'El leaderboard no está disponible todavía'
  } + {
    'en': AttendeesCounter.studentsAccepted,
    'es': 'alumnos confirmados'
  } + {
    'en': LessonsStatsPage.topStudents,
    'es': 'Mejores alumnos'
  } + {
    'en': LeaderboardPage.leaderboard,
    'es': 'Clasificación'
  } + {
    'en': GymSelectionButtons.aranhaGym,
  } + {
    'en': GymSelectionButtons.gulloGym,
  } + {
    'en': GymSelectionPage.heyUser,
    'es': 'Hola %s'
  } + {
    'en': GymSelectionPage.selectYourGym,
    'es': 'Escoge tu gymnasio'
  } + {
    'en': LoginBloc.loginError,
    'es': 'Error de inicio de sesion'
  } + {
    'en': EmptyPaymentMethod.connectBankAccount,
    'es': 'Conecta tu banco'
  } + {
    'en': EmptyPaymentMethod.noRegisteredPaymentMethod,
    'es': 'No hay métodos de pago registrados'
  } + {
    'en': ActivePaymentMethodView.bankAccount,
    'es': 'Cuenta Bancaria'
  } + {
    'en': ActivePaymentMethodView.billingEmail,
    'es': 'Correo de facturación'
  } + {
    'en': ActivePaymentMethodView.changePaymentInfo,
    'es': 'Cambia tu información'
  } + {
    'en': PlansFooter.note,
    'es': 'nota'
  } + {
    'en': PlansFooter.subscriptionDisclaimer,
    'es': 'los precios mostrados aquí representan los de la subscripción anual'
  } + {
    'en': PriceFooter.note,
    'es': 'nota'
  } + {
    'en': PriceFooter.pricesDisclaimer,
    'es': 'no podrá reducir el período de tiempo de su suscripción'
  } + {
    'en': PlansList.noPlansYet,
    'es': 'No hay subscripciónes disponibles todavía'
  } + {
    'en': PlansCallout.chooseYourSubscription,
    'es': 'Escoge la subscripción que mejor se adapta a tus necesidades'
  } + {
    'en': PlansPage.subscriptions,
    'es': 'Subscripciones'
  } + {
    'en': SubPlanPage.prices,
    'es': 'Precios'
  } + {
    'en': GraduateFabView.graduateStudent,
    'es': 'Graduar estudiante'
  } + {
    'en': GraduateDialog.graduate,
    'es': 'Graduar'
  } + {
    'en': GraduateDialog.cancel,
    'es': 'Cancelar'
  } + {
    'en': GraduateDialog.graduateAnyway,
    'es': 'Graduar igualmente'
  } + {
    'en': GraduateDialog.notReadyYet,
    'es': 'Todavía no cuenta con las clases necesarias para graduarse',
  } + {
    'en': GraduateDialog.readyForGraduation,
    'es': 'Ya tiene todas las clases necesarias para graduarse'
  };

String get i18n => localize(this, _t);

String plural(int value) => localizePlural(value, this, _t);

String fill(List<Object> params) => localizeFill(this, params);

String gender(String gender) => localizeVersion(gender, this, _t);

}