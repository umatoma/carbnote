import 'package:flutter/material.dart';

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

final ThemeData cnThemeData = ThemeData(
  fontFamily: _fontFamily,
  primarySwatch: _primarySwatch,
  backgroundColor: _backgroundColor,
  elevatedButtonTheme: _elevatedButtonTheme,
  outlinedButtonTheme: _outlinedButtonTheme,
);
