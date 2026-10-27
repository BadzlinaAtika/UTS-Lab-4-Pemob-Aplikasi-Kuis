import 'package:flutter/material.dart';

/// Mengatur mode terang/gelap. Awalnya mengikuti pengaturan sistem,
/// setelah tombol ditekan mengikuti pilihan pengguna.
class ThemeProvider extends ChangeNotifier {
  ThemeMode _mode = ThemeMode.system;
  ThemeMode get mode => _mode;

  /// Apakah tampilan saat ini gelap (memperhitungkan mode sistem).
  bool isDark(BuildContext context) =>
      _mode == ThemeMode.dark ||
          (_mode == ThemeMode.system &&
              MediaQuery.platformBrightnessOf(context) == Brightness.dark);

  void toggle(BuildContext context) {
    _mode = isDark(context) ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}