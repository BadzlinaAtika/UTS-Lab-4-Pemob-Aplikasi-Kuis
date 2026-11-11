import 'package:flutter/material.dart';

class AppTheme {

  static const Color primary = Color(0xFF000000);
  static const Color accent = Color(0xFF333333);
  static const Color correct = Color(0xFF000000);
  static const Color wrong = Color(0xFF777777);

  static ThemeData _base(Brightness b) {
    final scheme = ColorScheme.fromSeed(seedColor: primary, brightness: b);
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      colorScheme: scheme,

      scaffoldBackgroundColor:
      b == Brightness.dark ? const Color(0xFF000000) : const Color(0xFFFFFFFF),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
    );
  }

  static ThemeData get light => _base(Brightness.light);
  static ThemeData get dark => _base(Brightness.dark);
}