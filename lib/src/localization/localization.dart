import 'package:checkin/src/blocs/dynamic_link/bloc.dart';
import 'package:checkin/src/blocs/login/bloc.dart';
import 'package:checkin/src/constants.dart' as constants;
import 'package:checkin/src/models/grade.dart';
import 'package:checkin/src/ui/components/account/payment.dart';
import 'package:checkin/src/ui/components/email_retrieval/check_email_view.dart';
import 'package:checkin/src/ui/components/email_retrieval/insert_email_view.dart';
import 'package:checkin/src/ui/components/email_retrieval/wrong_email_dialog.dart';
import 'package:checkin/src/ui/components/lesson_card.dart';
import 'package:checkin/src/ui/components/lessons/filter_list_widget.dart';
import 'package:checkin/src/ui/components/login/apple_sign_in_button.dart';
import 'package:checkin/src/ui/components/login/login_form.dart';
import 'package:checkin/src/ui/components/login/passwordless_sign_in_button.dart';
import 'package:checkin/src/ui/components/payment_methods/active_payment_method.dart';
import 'package:checkin/src/ui/components/payment_methods/empty_payment_method.dart';
import 'package:checkin/src/ui/components/plans/plans_callout.dart';
import 'package:checkin/src/ui/components/plans/plans_footer.dart';
import 'package:checkin/src/ui/components/plans/plans_list.dart';
import 'package:checkin/src/ui/components/plans/price/price_footer.dart';
import 'package:checkin/src/ui/components/registry/accept_all_dialog.dart';
import 'package:checkin/src/ui/components/registry/attendee_tile.dart';
import 'package:checkin/src/ui/components/registry/attendees_list.dart';
import 'package:checkin/src/ui/components/registry/register_dialog.dart';
import 'package:checkin/src/ui/components/registry/registry_counter.dart';
import 'package:checkin/src/ui/components/lessons/attendees_preview.dart';
import 'package:checkin/src/ui/components/login/google_sign_in_button.dart';
import 'package:checkin/src/ui/components/grade_card.dart';
import 'package:checkin/src/ui/components/leaderboard/no_leaderboard_banner.dart';
import 'package:checkin/src/ui/components/registry/empty_registry.dart';
import 'package:checkin/src/ui/components/registry/lesson_infos.dart';
import 'package:checkin/src/ui/components/membership/active_membership.dart';
import 'package:checkin/src/ui/components/membership/inactive_membership.dart';
import 'package:checkin/src/ui/components/membership/unsubscribe_dialog.dart';
import 'package:checkin/src/ui/components/lessons/no_lessons_banner.dart';
import 'package:checkin/src/ui/components/profile_card.dart';
import 'package:checkin/src/ui/components/profile_infos.dart';
import 'package:checkin/src/ui/components/registry/registry_controls.dart';
import 'package:checkin/src/ui/components/registry/registry_missing_dialog.dart';
import 'package:checkin/src/ui/components/registry/remove_student_dialog.dart';
import 'package:checkin/src/ui/components/registry/student_button.dart';
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
    'es': 'Clases',
    'it': 'Classi',
  } + {
    'en': LessonCard.emptyClass,
    'es': 'Nadie en clase todavía',
    'it': 'Ancora nessuno in classe',
  } + {
    'en': GradePage.selectYourBelt,
    'es': '¿Cuál es tu cinturón?',
    'it': 'Che cintura sei?',
  } + {
    'en': RegistryPage.registry,
    'es': 'Registro',
    'it': 'Registro',
  } + {
    'en': RegistryMissingDialog.thisClassHasBeenCancelled,
    'es': 'Esta clase ha sido cancelada',
    'it': 'La classe é stata cancellata',
  } + {
    'en': RegistryMissingDialog.goToClasses,
    'es': 'Vuelve a las clases',
    'it': 'Torna alle classi',
  } + {
    'en': StatsPage.stats,
    'es': 'Estadísticas',
    'it': 'Statistiche',
  } + {
    'en': constants.WEEK,
    'es': 'semana',
    'it': 'settimana',
  } + {
    'en': constants.MONTH,
    'es': 'mes',
    'it': 'mese',
  } + {
    'en': constants.YEAR,
    'es': 'año',
    'it': 'anno',
  } + {
    'en': EmptyRegistry.emptyClass,
    'es': 'Nadie en clase todavía',
    'it': 'Classe ancora vuota',
  } + {
    'en': AttendedLessonsList.attendedClasses,
    'es': 'Clases atendidas',
    'it': 'Classi confermate',
  } + {
    'en': MatTimeCounter.matTime,
    'es': 'Horas de mat',
    'it': 'Ore sul mat',
  } + {
    'en': MatTimeCounter.numHours
        .zero('0 hours')
        .one('1 hour')
        .many('%d hours'),
    'es': '%d horas'
        .zero('0 horas')
        .one('1 hora')
        .many('%d horas'),
    'it': '%d ore'
        .zero('0 ore')
        .one('1 ora')
        .many('%d ore'),
  } + {
    'en': MatTimeCounter.hours
        .zero('hours')
        .one('hour')
        .many('hours'),
    'es': 'horas'
        .zero('horas')
        .one('hora')
        .many('horas'),
    'it': 'horas'
        .zero('ore')
        .one('ora')
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
    'it': 'Hai frequentato %d classi'
        .zero('Non hai frequentato nessuna classe')
        .one('Hai frequentato una classe')
        .many('Hai frequentato %d classi'),
  } + {
    'en': MatTimeCounter.thisTimespan
        .modifier(constants.WEEK, 'this week')
        .modifier(constants.MONTH, 'this month')
        .modifier(constants.YEAR, 'this year'),
    'es': 'este %s'
        .modifier(constants.WEEK, 'esta semana')
        .modifier(constants.MONTH, 'este mes')
        .modifier(constants.YEAR, 'este año'),
    'it': 'questo %s'
        .modifier(constants.WEEK, 'questa settimana')
        .modifier(constants.MONTH, 'questo mese')
        .modifier(constants.YEAR, 'quest\'anno'),
  } + {
    'en': RegistryCounter.full,
    'es': 'completo',
    'it': 'completo',
  }  + {
    'en': RegistryCounter.attendees,
    'es': 'Participantes',
    'it': 'Partecipanti',
  } + {
    'en': AttendeeTile.you,
    'es': 'Tú',
    'it': 'Tu',
  } + {
    'en': AttendeeTile.youHaveNoMoreAvailableSessions,
    'es': 'No tienes más sesiones disponibles',
    'it': 'Non hai piú sessioni disponibili',
  } +{
    'en': AttendeeTile.thisStudentIsInSessionOverdue,
    'es': 'Este estudiante ya no tienes sesiones disponibles',
    'it': 'Questo studente non ha piú sessioni disponibili',
  } + {
    'en': LessonInfos.and,
    'es': 'y',
    'it': 'e',
  } + {
    'en': AttendeesPreview.andOthers
        .one('and another one')
        .many('and %d others'),
    'es': 'y %d más'
        .one('y uno más')
        .many('y %d más'),
    'it': 'e altri %d'
        .one('e un altro')
        .many('e altri %d'),
  } + {
    'en': NoLessonsBanner.noClasses,
    'es': 'No hay clases hoy',
    'it': 'Non ci sono classi oggi',
  } + {
    'en': Grade.white.name,
    'es': 'Blanco',
    'it': 'Bianca',
  } + {
    'en': Grade.blue.name,
    'es': 'Azul',
    'it': 'Blu',
  } + {
    'en': Grade.purple.name,
    'es': 'Morado',
    'it': 'Viola',
  } + {
    'en': Grade.brown.name,
    'es': 'Marrón',
    'it': 'Marrone',
  } + {
    'en': Grade.black.name,
    'es': 'Negro',
    'it': 'Nera',
  } + {
    'en': Grade.white.description,
    'es': 'Construyendo las bases',
    'it': 'Costruendo le fondamenta',
  } + {
    'en': Grade.blue.description,
    'es': 'Desarrollo de la habilidad técnica',
    'it': 'Sviluppando l\'abilitá tecnica',
  } + {
    'en': Grade.purple.description,
    'es': 'Desarrollo del juego y experimentación',
    'it': 'Sviluppo del gioco e sperimentazione',
  } + {
    'en': Grade.brown.description,
    'es': 'Pensar conceptualmente y fortalecer las debilidades',
    'it': 'Pensare concettualmente e rafforzare le debolezze',
  } + {
    'en': Grade.black.description,
    'es': 'Comenzar de nuevo, enseñar y reflexionar',
    'it': 'Rincominciare, insegnare e riflettere',
  } + {
    'en': StudentButton.unregisterClass,
    'es': 'Desapuntate de la clase',
    'it': 'Cancellati dalla classe',
  } + {
    'en': StudentButton.registerClass,
    'es': 'Apuntate a la clase',
    'it': 'Iscriviti alla classe',
  } + {
    'en': StudentButton.registryFull,
    'es': 'Clase completa',
    'it': 'Classe piena',
  } + {
    'en': RegistryControls.acceptAll,
    'es': 'Aceptar todos',
    'it': 'Accetta tutti',
  } + {
    'en': RegisterDialog.cancel,
    'es': 'Cancelar',
    'it': 'Cancella',
  } + {
    'en': RegisterDialog.continueAnyway,
    'es': 'Registrame igualmente',
    'it': 'Registrami lo stesso',
  } + {
    'en': RegisterDialog.userFinishedAvailableSessions,
    'es': 'Ya has usado todas las sesiones disponibles',
    'it': 'Hai utilizzato tutte le sessioni disponibili',
  } + {
    'en': AcceptAllDialog.cancel,
    'es': 'Cancelar',
    'it': 'Cancella',
  } + {
    'en': AcceptAllDialog.confirm,
    'es': 'Confirmar',
    'it': 'Conferma',
  } + {
    'en': AcceptAllDialog.acceptingAllTheStudentsDisclaimer,
    'You are going to confirm all the students in class'
    'es': 'Estás a punto de aceptar todos los estudiantes',
    'it': 'Stai per accettare tutti gli studenti',
  } + {
    'en': GoogleSignInButton.googleSignIn,
    'es': 'Acceso con Google',
    'it': 'Accedi con Google',
  } + {
    'en': AppleSignInButton.appleSignIn,
    'es': 'Acceso con Apple',
    'it': 'Accedi con Apple',
  } + {
    'en': AccountPage.account,
    'es': 'Cuenta',
    'it': 'Account',
  } + {
    'en': Payment.membership,
    'es': 'Afiliación',
    'it': 'Membership',
  } + {
    'en': Payment.paymentMethods,
    'es': 'Metodos de pago',
    'it': 'Metodi di pagamento',
  } + {
    'en': AccountPage.profile,
    'es': 'Perfil',
    'it': 'Profilo',
  } + {
    'en': PaymentSuccessPage.paymentSuccessful,
    'es': 'Pagado con éxito',
    'it': 'Pagato con successo',
  } + {
    'en': PaymentSuccessPage.goToAccount,
    'es': 'Volver a la cuenta',
    'it': 'Torna all\'account',
  } + {
    'en': PaymentSuccessPage.disclaimerSubscription30Min,
    'es': 'Tu subscripción puede tardar hasta 30 minutos en aparecer en tu cuenta',
    'it': 'Il tuo abbonamento può tardare fino a 30 minuti ad apparire nel tuo account',
  } + {
    'en': ActiveMembershipView.unsubscribe,
    'es': 'Darse de baja',
    'it': 'Cancella abbonamento',
  } + {
    'en': ActiveMembershipView.nextBilling,
    'es': 'El siguiente pago es el',
    'it': 'Il prossimo pagamento avverrà il',
  } + {
    'en': ActiveMembershipView.yourSubscription,
    'es': 'Tu subscripción',
    'it': 'Il tuo abbonamento',
  } + {
    'en': ActiveMembershipView.remainingSessions,
    'es': 'Sesiones restantes',
    'it': 'Sessioni rimanenti',
  } + {
    'en': ProfileCard.enterYourName,
    'es': 'Escribe tu nombre',
    'it': 'Digita il tuo nome',
  } + {
    'en': InactiveMembershipView.chooseYourSubscription,
    'es': 'Escoge tu subscripción',
    'it': 'Scegli il tuo abbonamento',
  } + {
    'en': InactiveMembershipView.notActiveSubscription,
    'es': 'Tu subscripción no está activa todavía',
    'it': 'Il tuo abbonamento non é ancora attivo',
  } + {
    'en': UnsubscribeDialog.unsubscribe,
    'es': 'Darse de baja',
    'it': 'Cancella abbonamento',
  } + {
    'en': UnsubscribeDialog.aboutToPermanentlyDeleteSubscription,
    'es': 'Estás a punto de cancelar tu cuota de forma permanente',
    'it': 'Stai per cancellare il tuo abbonamento permanentemente',
  } + {
    'en': UnsubscribeDialog.cannotBeUndone,
    'es': 'Esta operación no se puede deshacer',
    'it': 'Questa operazione non puó essere annullata',
  } + {
    'en': UnsubscribeDialog.keepSubscription,
    'es': 'Mantener subscripción',
    'it': 'Mantieni abbonamento',
  } + {
    'en': GradeCard.beltColor,
    'es': 'Cinturón %s',
    'it': 'Cintura %s',
  } + {
    'en': ProfileInfos.beltColor,
    'es': 'Cinturón %s',
    'it': 'Cintura %s',
  } + {
    'en': ProfileInfos.beltColor,
    'es': 'Cinturón %s',
    'it': 'Cintura %s',
  } + {
    'en': UpgraderDialog.update,
    'es': 'Actualizar',
    'it': 'Update',
  } + {
    'en': UpgraderDialog.versionNotSupported,
    'es': 'La versión actual de esta aplicación ya no es compatible\n\nPor favor, actualízala',
    'it': 'Questa versione dell\'app non é piú supportata\n\nPer favore aggiornala',
  } + {
    'en': NoLeaderboardBanner.noLeaderboard,
    'es': 'El leaderboard no está disponible todavía',
    'it': 'La classifica non é ancora disponibile',
  } + {
    'en': AttendeesCounter.studentsAccepted,
    'es': 'alumnos confirmados',
    'it': 'studenti confermati',
  } + {
    'en': LessonsStatsPage.topStudents,
    'es': 'Mejores alumnos',
    'it': 'Studenti migliori',
  } + {
    'en': LeaderboardPage.leaderboard,
    'es': 'Clasificación',
    'it': 'Classifica',
  } + {
    'en': UnselectedGymPage.heyUser,
    'es': 'Hola %s',
    'it': 'Ciao %s',
  } + {
    'en': UnselectedGymPage.contactYourGymOwner,
    'es': 'Porfavor contacta el dueño del gym para obtener el enlace de referencia',
    'it': 'Perfavore contatta il proprietario dell`\'accademia per ottenere il referral link',
  } + {
    'en': LoginBloc.loginError,
    'es': 'Error de inicio de sesion',
    'it': 'Errore nella login',
  } + {
    'en': EmptyPaymentMethod.connectBankAccount,
    'es': 'Conecta tu banco',
    'it': 'Connetti il tuo conto corrente',
  } + {
    'en': EmptyPaymentMethod.noRegisteredPaymentMethod,
    'es': 'No hay métodos de pago registrados',
    'it': 'Non ci sono metodi di pagamento registrati',
  } + {
    'en': ActivePaymentMethodView.bankAccount,
    'es': 'Cuenta Bancaria',
    'it': 'Conto Corrente',
  } + {
    'en': ActivePaymentMethodView.billingEmail,
    'es': 'Correo de facturación',
    'it': 'Email di fatturazione',
  } + {
    'en': ActivePaymentMethodView.changePaymentInfo,
    'es': 'Cambia tu información',
    'it': 'Aggiorna informazioni',
  } + {
    'en': PlansFooter.note,
    'es': 'nota',
    'it': 'nota',
  } + {
    'en': PlansFooter.subscriptionDisclaimer,
    'es': 'los precios mostrados aquí representan los de la subscripción anual',
    'it': 'i prezzi rappresentano l\'abbonamento annuale',
  } + {
    'en': PriceFooter.note,
    'es': 'nota',
    'it': 'nota',
  } + {
    'en': PriceFooter.pricesDisclaimer,
    'es': 'no podrá reducir el período de tiempo de su suscripción',
    'it': 'non potrai ridurre il periodo del tuo abbonamento',
  } + {
    'en': PlansList.noPlansYet,
    'es': 'No hay subscripciónes disponibles todavía',
    'it': 'Non ci sono abbonamenti disponibili',
  } + {
    'en': PlansCallout.chooseYourSubscription,
    'es': 'Escoge la subscripción que mejor se adapta a tus necesidades',
    'it': 'Scegli l\'abbonamento che si adatta alle tue necessitá',
  } + {
    'en': PlansPage.subscriptions,
    'es': 'Subscripciones',
    'it': 'Abbonamenti',
  } + {
    'en': SubPlanPage.prices,
    'es': 'Precios',
    'it': 'Prezzi',
  } + {
    'en': GraduateFabView.graduateStudent,
    'es': 'Graduar estudiante',
    'it': 'Promuovi studente',
  } + {
    'en': GraduateDialog.graduate,
    'es': 'Graduar',
    'it': 'Promuovi',
  } + {
    'en': GraduateDialog.cancel,
    'es': 'Cancelar',
    'it': 'Cancella',
  } + {
    'en': GraduateDialog.graduateAnyway,
    'es': 'Graduar igualmente',
    'it': 'Promuovi lo stesso',
  } + {
    'en': GraduateDialog.notReadyYet,
    'es': 'Todavía no cuenta con las clases necesarias para graduarse',
    'it': 'Non ha ancora le classi necessarie per essere promosso',
  } + {
    'en': GraduateDialog.readyForGraduation,
    'es': 'Ya tiene todas las clases necesarias para graduarse',
    'it': 'Ha tutte le classi necessarie per essere promosso',
  } + {
    'en': PasswordlessSignInButton.emailMeMagicLink,
    'es': 'Enviame un enlace mágico',
    'it': 'Inviami un magic link',
  } + {
    'en': CheckEmailView.checkYourEmail,
    'es': '¡Revisa tu correo!',
    'it': 'Controlla la mail!',
  } + {
    'en': CheckEmailView.toConfirmEmail,
    'es': 'Para confirmar tu dirección, toca el enlace en el correo que enviamos a',
    'it': 'Per confermare la tua email fai tap su link nella mail che ti abbiamo inviato a',
  } + {
    'en': CheckEmailView.openEmailApp,
    'es': 'Abrir correo electrónico',
    'it': 'Apri posta elettronica',
  } + {
    'en': InsertEmailView.insetEmailPlaceholder,
    'es': 'Tu dirección de correo',
    'it': 'Il tuo indirizzo email',
  } + {
    'en': InsertEmailView.invalidEmail,
    'es': 'Ha habido un problema con tu correo electrónico. Comprúebalo y inténtalo de nuevo',
    'it': 'C\'è stato un problema con la tua email. Controllala e riprova',
  } + {
    'en': InsertEmailView.sendEmailExplanation,
    'es': 'Te enviaremos un correo con el que te conectaras al instante',
    'it': 'Ti invieremo una mail con la quale potrai connetterti instantaneamente',
  } + {
    'en': InsertEmailView.next,
    'es': 'Siguiente',
    'it': 'Continua',
  } + {
    'en': DynamicLinkBloc.invalidActionError,
    'es': 'El enlace mágico se caducó o ya ha sido utilizado',
    'it': 'Il magic link é scaduto o é già stato utilizzato',
  } + {
    'en': DynamicLinkBloc.emailMissingError,
    'es': 'Asegúrate de abrir el enlace mágico en el mismo device en que lo recibiste',
    'it': 'Assicurati di aver aperto il magic link nello stesso dispositivo in cui l\'hai ricevuto',
  } + {
    'en': WrongEmailDialog.goBack,
    'es': 'Volver atrás',
    'it': 'Torna indietro',
  } + {
    'en': WrongEmailDialog.theEmailYouInsertedMightNotBeCorrect,
    'es': 'Es posible que el correo electrónico que ingresó no sea correcto',
    'it': 'La mail che hai inserito potrebbe non essere corretta',
  } + {
    'en': LoginForm.or,
    'es': 'o',
    'it': 'oppure',
  } + {
    'en': Attendees.removeStudent,
    'es': 'Eliminar',
    'it': 'Rimuovi'
  } + {
    'en': RemoveStudentDialog.remove,
    'es': 'Eliminar',
    'it': 'Rimuovi'
  } + {
    'en': RemoveStudentDialog.removeStudentDisclaimer,
    'es': '¿Estás seguro que quieres eliminar este estudiente de la clase?',
    'it': 'Sei sicuro di voler rimuovere questo studente dalla classe?'
  } + {
    'en': RemoveStudentDialog.keepStudentInClass,
    'es': 'Mantener',
    'it': 'Mantieni'
  } + {
    'en': FilterListWidget.noFiltersAvailable,
    'es': 'No hay filtros disponibles',
    'it': 'Nessun filtro disponibile'
  };

String get i18n => localize(this, _t);

String plural(int value) => localizePlural(value, this, _t);

String fill(List<Object> params) => localizeFill(this, params);

String gender(String gender) => localizeVersion(gender, this, _t);

}