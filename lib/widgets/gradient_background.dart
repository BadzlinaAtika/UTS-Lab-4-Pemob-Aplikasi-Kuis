import 'package:flutter/material.dart';
import '../utils/responsive.dart';

/// Latar gradien + pembatas lebar konten agar tetap rapi di tablet/web.
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
              ? const [Color(0xFF12111A), Color(0xFF241B4A)]
              : const [Color(0xFFF6F4FF), Color(0xFFE5DDFF)],
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