import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF6C4CFF);
  static const Color accent = Color(0xFFFF5CAA);
  static const Color correct = Color(0xFF22C55E);
  static const Color wrong = Color(0xFFEF4444);

  static ThemeData _base(Brightness b) {
    final scheme = ColorScheme.fromSeed(seedColor: primary, brightness: b);
    return ThemeData(
      useMaterial3: true,
      fontFamily: 'Poppins',
      colorScheme: scheme,
      scaffoldBackgroundColor:
      b == Brightness.dark ? const Color(0xFF12111A) : const Color(0xFFF6F4FF),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
      ),
    );
  }

  static ThemeData get light => _base(Brightness.light);
  static ThemeData get dark => _base(Brightness.dark);
}