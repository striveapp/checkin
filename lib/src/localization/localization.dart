import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'localization_strings.dart';


class Localization {
  final Locale locale;

  Localization(this.locale);

  static Localization of(BuildContext context) {
    return Localizations.of<Localization>(context, Localization);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'es' : es,
    'en' : en
  };

  getValue(String key) => _localizedValues[locale.languageCode][key];

  // remove
  String get appTitle => getValue(AppTitle);
  String get registerTitle => getValue(RegisterTitle);
  String get registerButton => getValue(RegisterButton);

  // nostre
  String get emptyClass => getValue(EmptyClass);
  String get totalClasses => getValue(TotalClasses);
  String get googleSignin => getValue(GoogleSignin);
  String get beltSelection => getValue(BeltSelection);
  String get registry => getValue(Registry);
  String get acceptAll => getValue(AcceptAll);
  String get logout => getValue(Logout);
  String get attendClass => getValue(AttendClass);
  String get status => getValue(Status);
  String get loginFailed => getValue(LoginFailed);
  String get whiteGrade => getValue(WhiteGrade);
  String get blueGrade => getValue(BlueGrade);
  String get purpleGrade => getValue(PurpleGrade);
  String get brownGrade => getValue(BrownGrade);
  String get blackGrade => getValue(BlackGrade);

}

class LocalizationDelegate extends LocalizationsDelegate<Localization> {
  const LocalizationDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'es'].contains(locale.languageCode);

  @override
  Future<Localization> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of Localization.
    return SynchronousFuture<Localization>(Localization(locale));
  }

  @override
  bool shouldReload(LocalizationDelegate old) => false;
}