import 'package:carbnote/view/providers.dart';
import 'package:carbnote/view/screens/home/home_screen.dart';
import 'package:carbnote/view/screens/start/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';

const _fontFamily = 'NotoSansJP';
const _backgroundColor = Colors.white;
const _primaryColor = Color(0xFF5663FF);
final _primarySwatch = MaterialColor(
  _primaryColor.value,
  const <int, Color>{
    50: Color(0xFFfaf4ff),
    100: Color(0xFFc6c1ff),
    200: Color(0xFFc6c1ff),
    300: Color(0xFF9291FF),
    400: Color(0xFF9291FF),
    500: _primaryColor,
    600: Color(0xFF0039CB),
    700: Color(0xFF0039CB),
    800: Color(0xFF001399),
    900: Color(0xFF001399),
  },
);
final _elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    elevation: 0,
  ),
);
final _outlinedButtonTheme = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    elevation: 0,
  ),
);

class LcApp extends StatefulWidget {
  const LcApp({Key key}) : super(key: key);

  @override
  _LcAppState createState() => _LcAppState();
}

class _LcAppState extends State<LcApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Carb Note',
      theme: ThemeData(
        fontFamily: _fontFamily,
        primarySwatch: _primarySwatch,
        backgroundColor: _backgroundColor,
        elevatedButtonTheme: _elevatedButtonTheme,
        outlinedButtonTheme: _outlinedButtonTheme,
      ),
      navigatorKey: context.read(navKeyProvider),
      home: context.read(authRepoProvider).getCurrentUser() == null
          ? const StartScreen()
          : const HomeScreen(),
    );
  }
}
