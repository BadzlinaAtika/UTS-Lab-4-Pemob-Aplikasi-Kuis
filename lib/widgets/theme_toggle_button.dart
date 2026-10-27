import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/theme_provider.dart';
import '../utils/responsive.dart';

/// Tombol ganti mode terang/gelap. Dipakai di semua halaman.
class ThemeToggleButton extends StatelessWidget {
  const ThemeToggleButton({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = context.watch<ThemeProvider>().isDark(context);
    return IconButton(
      tooltip: dark ? 'Mode terang' : 'Mode gelap',
      iconSize: context.sp(26),
      onPressed: () => context.read<ThemeProvider>().toggle(context),
      icon: Icon(dark ? Icons.light_mode_rounded : Icons.dark_mode_rounded),
    );
  }
}