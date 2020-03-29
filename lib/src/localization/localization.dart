import 'package:checkin/src/constants.dart' as constants;
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/ui/components/attendee_tile.dart';
import 'package:checkin/src/ui/components/lesson_attendees_counter.dart';
import 'package:checkin/src/ui/components/attendees_preview.dart';
import 'package:checkin/src/ui/components/google_sign_in_button.dart';
import 'package:checkin/src/ui/components/grade_card.dart';
import 'package:checkin/src/ui/components/leaderboard/no_leaderboard_banner.dart';
import 'package:checkin/src/ui/components/lesson_infos.dart';
import 'package:checkin/src/ui/components/membership/active_membership.dart';
import 'package:checkin/src/ui/components/membership/inactive_membership.dart';
import 'package:checkin/src/ui/components/membership/unsubscribe_dialog.dart';
import 'package:checkin/src/ui/components/no_lessons_banner.dart';
import 'package:checkin/src/ui/components/profile_card.dart';
import 'package:checkin/src/ui/components/profile_infos.dart';
import 'package:checkin/src/ui/components/registry_controls.dart';
import 'package:checkin/src/ui/components/stats/user/attended_lessons_list.dart';
import 'package:checkin/src/ui/components/stats/user/mat_time_counter.dart';
import 'package:checkin/src/ui/components/upgrader_dialog.dart';
import 'package:checkin/src/ui/pages/account_page.dart';
import 'package:checkin/src/ui/pages/grade_page.dart';
import 'package:checkin/src/ui/pages/lessons_page.dart';
import 'package:checkin/src/ui/pages/payment_success_page.dart';
import 'package:checkin/src/ui/pages/registry_page.dart';
import 'package:checkin/src/ui/pages/user_stats_page.dart';
import 'package:checkin/src/ui/pages/subscriptions_page.dart';
import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  // ignore: unused_field
  static var _t = Translations('en') + {
    'en': LessonsPage.classes,
    'es': "Clases",
  } + {
    'en': GradePage.beltSelection,
    'es': 'Cuál es tu cinturón?',
  } + {
    'en': RegistryPage.registry,
    'es': 'Registro',
  } + {
    'en': UserStatsPage.stats,
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
    'en': constants.by,
    'es': 'Por',
  } + {
    'en': constants.emptyClass,
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
    'en': LessonAttendeesCounter.full,
    'es': 'lleno',
  }  + {
    'en': LessonAttendeesCounter.attendees,
    'es': 'Participantes',
  } + {
    'en': AttendeeTile.you,
    'es': 'Tú',
  } + {
    'en': LessonInfos.and,
    'es': 'y',
  } + {
    'en': AttendeesPreview.andOthers
        .one('and another one')
        .many('and %d others'),
    'es': 'y %d otros'
        .one('y un otro')
        .many('y %d otros'),
  } + {
    'en': NoLessonsBanner.noClasses,
    'es': 'No hay clases hoy',
  } + {
    'en': Grade.white.name,
    'es': 'Blanco',
  } + {
    'en': Grade.blue.name,
    'es': 'Azúl',
  } + {
    'en': Grade.purple.name,
    'es': 'Morado',
  } + {
    'en': Grade.brown.name,
    'es': 'Marron',
  } + {
    'en': Grade.black.name,
    'es': 'Negro',
  } + {
    'en': Grade.white.description,
    'es': 'Construyendo las bases',
  } + {
    'en': Grade.blue.description,
    'es': 'Habilidad técnica',
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
    'es': 'Despuntarse de clase',
  } + {
    'en': RegistryControls.registerClass,
    'es': 'Apuntarse a clase',
  } + {
    'en': RegistryControls.acceptAll,
    'es': 'Aceptar todos',
  } + {
    'en': GoogleSignInButton.googleSignin,
    'es': 'Acceso con Google',
  } + {
    'en': AccountPage.account,
    'es': 'Cuenta',
  } + {
    'en': AccountPage.membership,
    'es': 'Afiliación',
  } + {
    'en': AccountPage.profile,
    'es': 'Perfil',
  } + {
    'en': PaymentSuccessPage.paymentSuccessful,
    'es': 'Pagado con Exito',
  } + {
    'en': PaymentSuccessPage.goToAccount,
    'es': 'Volver a la Cuenta',
  } + {
    'en': PaymentSuccessPage.disclaimerSubscription30Min,
    'es': 'Tu subscripción puede tardar hasta 30 minutos en aparecer en tu cuenta',
  } + {
    'en': ActiveMembershipView.email,
    'es': 'Correo:',
  } + {
    'en': ActiveMembershipView.creditCard,
    'es': 'Tarjeta:',
  } + {
    'en': ActiveMembershipView.unsubscribe,
    'es': 'Darse de baja',
  } + {
    'en': ActiveMembershipView.nextBilling,
    'es': 'El siguiente pago es el',
  } + {
    'en': ProfileCard.enterYourName,
    'es': 'Intorduzca su nombre',
  } + {
    'en': InactiveMembershipView.subscribe,
    'es': 'Suscribirse',
  } + {
    'en': InactiveMembershipView.notActiveSubscription,
    'es': 'Tu subscripción no está activa todavia',
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
    'en': SubscriptionsPage.subscriptions,
    'es': 'Subscripciónes',
  } + {
    'en': SubscriptionsPage.chooseSub,
    'es': 'Escoje tu subscripción',
  } + {
    'en': GradeCard.beltColor,
    'es': 'Cinturón %s'
  } + {
    'en': ProfileInfos.beltColor,
    'es': 'Cinturón %s'
  } + {
    'en': UpgraderDialog.update,
    'es': 'Actualizar'
  } + {
    'en': UpgraderDialog.versionNotSupported,
    'es': 'La versión actual de esta aplicación ya no es compatible\n\nPor favor actualice ahora'
  } + {
    'en': NoLeaderboardBanner.noLeaderboard,
    'es': 'El leaderboard no està disponible todavia'
  };

String get i18n => localize(this, _t);

String plural(int value) => localizePlural(value, this, _t);

String fill(List<Object> params) => localizeFill(this, params);

String gender(String gender) => localizeVersion(gender, this, _t);

}