import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:i18n_extension/i18n_widget.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget, {Locale locale = const Locale("es", "")}) {
    return pumpWidget(
      MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', ''),
          const Locale('es', ''),
          const Locale('it', ''),
        ],
        home: I18n(
          initialLocale: locale,
          child: widget,
        ),
      ),
    );
  }

  Future<void> pumpAppWithScaffold(Widget widget, {locale = const Locale("es", "")}) {
    return pumpApp(
      Scaffold(
        body: widget,
      ),
      locale: locale,
    );
  }
}
