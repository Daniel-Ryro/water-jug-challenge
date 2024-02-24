import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalization  {
  static late Map<String, String> localizedStrings;

  static Future<AppLocalization > load(Locale locale) async {
    String fileName = 'lib/translations/strings_${locale.languageCode}.json';

    try {
      final String jsonString = await rootBundle.loadString(fileName);
      final Map<String, dynamic> jsonMap = json.decode(jsonString);
      localizedStrings =
          jsonMap.map((key, value) => MapEntry(key, value.toString()));
    } catch (e) {
      const String defaultFileName = 'lib/translations/strings_en.json';
      final String defaultJsonString =
          await rootBundle.loadString(defaultFileName);
      final Map<String, dynamic> defaultJsonMap =
          json.decode(defaultJsonString);
      localizedStrings =
          defaultJsonMap.map((key, value) => MapEntry(key, value.toString()));
    }

    return AppLocalization ();
  }

  static String get(String key) {
    return localizedStrings[key] ?? key;
  }

  static const LocalizationsDelegate<AppLocalization > delegate =
      _LocalizationDelegate();

  static const supportedLocales = [
    Locale('en'),
    Locale('es'),
    Locale('pt'),
  ];
}

class _LocalizationDelegate extends LocalizationsDelegate<AppLocalization > {
  const _LocalizationDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'es', 'pt'].contains(locale.languageCode);

  @override
  Future<AppLocalization > load(Locale locale) async {
    return await AppLocalization .load(locale);
  }

  @override
  bool shouldReload(_LocalizationDelegate old) => false;
}
