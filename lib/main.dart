import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:water_jug_challenge/views/home_page.dart';
import 'package:water_jug_challenge/helpers/localization.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Locale? deviceLocale = WidgetsBinding.instance.platformDispatcher.locale;

  await Localization.load(deviceLocale);

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
        Localization.delegate,
      ],
      locale: WidgetsBinding.instance.platformDispatcher.locale,
      supportedLocales: Localization.supportedLocales,
      home: const HomePage(),
    );
  }
}
