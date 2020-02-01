import 'package:checkin/src/constants.dart' as constants;
import 'package:checkin/src/ui/components/attended_lessons_list.dart';
import 'package:checkin/src/ui/components/attendee_tile.dart';
import 'package:checkin/src/ui/components/attendees_counter.dart';
import 'package:checkin/src/ui/components/attendees_preview.dart';
import 'package:checkin/src/ui/components/class_counter.dart';
import 'package:checkin/src/ui/components/days_picker.dart';
import 'package:checkin/src/ui/components/google_sign_in_button.dart';
import 'package:checkin/src/ui/components/grade_buttons.dart';
import 'package:checkin/src/ui/components/lesson_infos.dart';
import 'package:checkin/src/ui/components/mat_time_counter.dart';
import 'package:checkin/src/ui/components/membership/active_membership.dart';
import 'package:checkin/src/ui/components/membership/inactive_membership.dart';
import 'package:checkin/src/ui/components/membership/unsubscribe_dialog.dart';
import 'package:checkin/src/ui/components/no_lessons_banner.dart';
import 'package:checkin/src/ui/components/profile_card.dart';
import 'package:checkin/src/ui/components/registry_controls.dart';
import 'package:checkin/src/ui/pages/account_page.dart';
import 'package:checkin/src/ui/pages/grade_page.dart';
import 'package:checkin/src/ui/pages/lessons_page.dart';
import 'package:checkin/src/ui/pages/payment_success_page.dart';
import 'package:checkin/src/ui/pages/profile_page.dart';
import 'package:checkin/src/ui/pages/registry_page.dart';
import 'package:checkin/src/ui/pages/stats_page.dart';
import 'package:i18n_extension/i18n_extension.dart';

extension Localization on String {
  static var _t = Translations('en') + {
    'en': LessonsPage.classes,
    'es': "Clases",
  } + {
    'en': GradePage.beltSelection,
    'es': 'Cuál es tu cinturón?',
  } + {
    'en': ProfilePage.profile,
    'es': 'Perfil',
  } + {
    'en': ProfilePage.enterYourName,
    'es': 'Intorduzca su nombre',
  } + {
    'en': ProfilePage.logout,
    'es': 'Desconectar',
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
    'en': MatTimeCounter.hours
        .zero('0 hours')
        .one('1 hour')
        .many('%d hours'),
    'es': '%d horas'
        .zero('0 horas')
        .one('1 hora')
        .many('%d horas'),
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
    'en': AttendeesCounter.full,
    'es': 'lleno',
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
    'en': DaysPicker.today,
    'es': 'Hoy',
  } + {
    'en': GradeButtons.whiteGrade,
    'es': 'Blanco',
  } + {
    'en': GradeButtons.blueGrade,
    'es': 'Azúl',
  } + {
    'en': GradeButtons.purpleGrade,
    'es': 'Morado',
  } + {
    'en': GradeButtons.brownGrade,
    'es': 'Marron',
  } + {
    'en': GradeButtons.blackGrade,
    'es': 'Negro',
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
    'en': ClassCounter.totalClasses,
    'es': 'Clases atendidas',
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
  };

String get i18n => localize(this, _t);

String plural(int value) => localizePlural(value, this, _t);

String fill(List<Object> params) => localizeFill(this, params);

String gender(String gender) => localizeVersion(gender, this, _t);

}