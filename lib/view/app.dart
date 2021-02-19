import 'package:carbnote/view/providers.dart';
import 'package:carbnote/view/screens/home/home_screen.dart';
import 'package:carbnote/view/screens/start/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LcApp extends HookWidget {
  const LcApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carb Note',
      theme: useProvider(themeProvider).state,
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ja'),
      ],
      navigatorKey: context.read(navKeyProvider),
      home: context.read(authUserRepoProvider).getCurrent() == null
          ? const StartScreen()
          : const HomeScreen(),
    );
  }
}
