import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'features/catalog/presentation/pages/makers_main_page_page.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

final ThemeData theme = ThemeData();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.system;
  Locale _locale = Locale('es');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mobe APP',
      theme: theme.copyWith(
        colorScheme: theme.colorScheme.copyWith(
          primary: Colors.blue[900],
          secondary: Colors.blueAccent,
        ),
        inputDecorationTheme:
        const InputDecorationTheme(border: OutlineInputBorder()),
      ),
      darkTheme: ThemeData.dark(),
      themeMode: _themeMode,
      locale: _locale,
      // localizationsDelegates: const [
      //   AppLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      //   GlobalCupertinoLocalizations.delegate,
      // ],
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: const [
        Locale('en'), // English
        Locale('es'), // Spanish
      ],
      home: const MakersMainPage(),
    );
  }

  void changeTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  void changeLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }
}
