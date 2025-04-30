import 'package:flutter/material.dart';

ThemeData darkThemeData = ThemeData(
  fontFamily: 'Poppins',
  primaryColor: Color(0xff044386),
  primaryColorDark: Color(0xff19B159),
  primaryColorLight: Color(0xfffd6074),
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color(0xFF4),
  cardColor: const Color(0xFF0d0d23),
  hintColor: const Color(0xFFd0d1e3),

  ///text color
);

ThemeData lightThemeData = ThemeData(
  fontFamily: 'Poppins',
  primaryColor: Color(0xff044386),
  brightness: Brightness.light,
  scaffoldBackgroundColor: Color(0xffeaecf7),
  cardColor: const Color(0xFFFFFFFF),
  hintColor: const Color(0xFF1D202F),

  ///text color
  primaryColorDark: Color(0xff19B159),
  primaryColorLight: Color(0xfffd6074),
);
