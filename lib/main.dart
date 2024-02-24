import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:water_jug_challenge/views/water_jug_challenge_page.dart';
import 'package:water_jug_challenge/helpers/localization_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Locale? deviceLocale = WidgetsBinding.instance.platformDispatcher.locale;

  await AppLocalization.load(deviceLocale);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Water Jug Challenge',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        AppLocalization.delegate,
      ],
      locale: WidgetsBinding.instance.platformDispatcher.locale,
      supportedLocales: AppLocalization.supportedLocales,
      home: const ChallengePage(),
    );
  }
}
