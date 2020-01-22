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
import 'package:checkin/src/ui/components/no_lessons_banner.dart';
import 'package:checkin/src/ui/components/registry_controls.dart';
import 'package:checkin/src/ui/pages/grade_page.dart';
import 'package:checkin/src/ui/pages/lessons_page.dart';
import 'package:checkin/src/ui/pages/profile_page.dart';
import 'package:checkin/src/ui/pages/registry_page.dart';
import 'package:checkin/src/ui/pages/stats_page.dart';
import 'package:i18n_extension/i18n_extension.dart';


extension Localization on String {
  static var _t = Translations('en') + {
    'en': LessonsPage.classes,
    "es": "Clases",
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
    'es': 'mese',
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
    'en': MatTimeCounter.classesThis,
    'es': 'clases esta',
  } + {
    'en': MatTimeCounter.matTime,
    'es': 'Horas de Mat',
  } + {
    'en': MatTimeCounter.hours,
    'es': 'horas',
  } + {
    'en': MatTimeCounter.youAttended,
    'es': 'Has atendido',
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
    'en': AttendeesPreview.andOthers,
    'es': 'y otros',
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
  };

String get i18n => localize(this, _t);

}