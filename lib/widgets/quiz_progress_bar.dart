import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';

/// Nama pemain, nomor soal, dan bar progres di bagian atas halaman kuis.
class QuizProgressBar extends StatelessWidget {
  final String name;
  final int current; // dimulai dari 1
  final int total;

  const QuizProgressBar({
    super.key,
    required this.name,
    required this.current,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: context.sp(16),
              backgroundColor: AppTheme.primary,
              child: Icon(Icons.person_rounded, color: Colors.white, size: context.sp(18)),
            ),
            SizedBox(width: context.sp(10)),
            Expanded(
              child: Text(
                name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: context.sp(14), fontWeight: FontWeight.w600),
              ),
            ),
            Text(
              '$current / $total',
              style: TextStyle(
                fontSize: context.sp(14),
                fontWeight: FontWeight.w700,
                color: AppTheme.primary,
              ),
            ),
          ],
        ),
        SizedBox(height: context.sp(12)),
        ClipRRect(
          borderRadius: BorderRadius.circular(context.sp(10)),
          child: TweenAnimationBuilder<double>(
            tween: Tween(begin: 0, end: current / total),
            duration: const Duration(milliseconds: 350),
            builder: (_, value, __) => LinearProgressIndicator(
              value: value,
              minHeight: context.sp(10),
              backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
              valueColor: const AlwaysStoppedAnimation(AppTheme.accent),
            ),
          ),
        ),
      ],
    );
  }
}