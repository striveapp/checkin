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

  String get emptyClass => getValue(EmptyClass);
  String get totalClasses => getValue(TotalClasses);
  String get googleSignin => getValue(GoogleSignin);
  String get beltSelection => getValue(BeltSelection);
  String get registry => getValue(Registry);
  String get acceptAll => getValue(AcceptAll);
  String get logout => getValue(Logout);
  String get registerClass => getValue(RegisterClass);
  String get unregisterClass => getValue(UnregisterClass);
  String get status => getValue(Status);
  String get lessons => getValue(Classes);
  String get loginFailed => getValue(LoginFailed);
  String get whiteGrade => getValue(WhiteGrade);
  String get blueGrade => getValue(BlueGrade);
  String get purpleGrade => getValue(PurpleGrade);
  String get brownGrade => getValue(BrownGrade);
  String get blackGrade => getValue(BlackGrade);
  String get today => getValue(Today);
  String get noClasses => getValue(NoClasses);
  String get profile => getValue(Profile);
  String get swipeToRemove => getValue(SwipeToRemove);
  String get nameHint => getValue(NameHint);
  String get teacher => getValue(Teacher);
  String get andOthers => getValue(AndOthers);
  String get and => getValue(And);
  String get by => getValue(By);
  String get you => getValue(You);
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