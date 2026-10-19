import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';

/// Lingkaran skor beranimasi untuk halaman hasil.
class ScoreRing extends StatelessWidget {
  final int score;
  final int total;
  const ScoreRing({super.key, required this.score, required this.total});

  @override
  Widget build(BuildContext context) {
    final size = context.sp(150);
    return SizedBox(
      width: size,
      height: size,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: score / total),
        duration: const Duration(milliseconds: 900),
        curve: Curves.easeOutCubic,
        builder: (_, value, __) => Stack(
          fit: StackFit.expand,
          children: [
            CircularProgressIndicator(
              value: value,
              strokeWidth: context.sp(12),
              backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
              valueColor: const AlwaysStoppedAnimation(AppTheme.primary),
            ),
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '$score',
                    style: TextStyle(
                        fontSize: context.sp(40),
                        fontWeight: FontWeight.w700,
                        height: 1),
                  ),
                  Text(
                    'dari $total',
                    style: TextStyle(
                        fontSize: context.sp(12), fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}