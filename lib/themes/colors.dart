import 'package:flutter/material.dart';

const MaterialColor primary = MaterialColor(_primaryPrimaryValue, <int, Color>{
  50: Color(0xFFE2EEE8),
  100: Color(0xFFB6D4C5),
  200: Color(0xFF86B89E),
  300: Color(0xFF559C77),
  400: Color(0xFF30865A),
  500: Color(_primaryPrimaryValue),
  600: Color(0xFF0A6937),
  700: Color(0xFF085E2F),
  800: Color(0xFF065427),
  900: Color(0xFF03421A),
});
const int _primaryPrimaryValue = 0xFF0C713D;

const MaterialColor primaryAccent =
    MaterialColor(_primaryAccentValue, <int, Color>{
  100: Color(0xFF77FF9D),
  200: Color(_primaryAccentValue),
  400: Color(0xFF11FF54),
  700: Color(0xFF00F645),
});
const int _primaryAccentValue = 0xFF44FF78;
