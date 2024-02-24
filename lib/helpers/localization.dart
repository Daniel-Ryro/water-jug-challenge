import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Localization {
  static late Map<String, String> localizedStrings;

  static Future<Localization> load(Locale locale) async {
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

    return Localization();
  }

  static String get(String key) {
    return localizedStrings[key] ?? key;
  }

  static const LocalizationsDelegate<Localization> delegate =
      _LocalizationDelegate();

  static const supportedLocales = [
    Locale('en'),
    Locale('es'),
    Locale('pt'),
  ];
}

class _LocalizationDelegate extends LocalizationsDelegate<Localization> {
  const _LocalizationDelegate();

  @override
  bool isSupported(Locale locale) =>
      ['en', 'es', 'pt'].contains(locale.languageCode);

  @override
  Future<Localization> load(Locale locale) async {
    return await Localization.load(locale);
  }

  @override
  bool shouldReload(_LocalizationDelegate old) => false;
}
