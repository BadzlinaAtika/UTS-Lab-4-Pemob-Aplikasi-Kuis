import 'package:flutter/material.dart';
import '../utils/responsive.dart';

/// Latar gradien monokrom (hitam-putih) + pembatas lebar konten agar tetap rapi di tablet/web.
class GradientBackground extends StatelessWidget {
  final Widget child;
  const GradientBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: dark
              ? const [Color(0xFF000000), Color(0xFF1A1A1A)] // Hitam pekat ke abu-abu gelap (Dark Mode)
              : const [Color(0xFFFFFFFF), Color(0xFFF2F2F2)], // Putih bersih ke abu-abu sangat muda (Light Mode)
        ),
      ),
      child: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: context.contentWidth),
            child: child,
          ),
        ),
      ),
    );
  }
}