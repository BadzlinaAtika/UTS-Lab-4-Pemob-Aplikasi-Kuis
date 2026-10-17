import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';

/// Satu pilihan jawaban (A, B, C, D). Dipakai berulang di halaman kuis.
class AnswerOption extends StatelessWidget {
  final String letter;
  final String text;
  final bool selected;
  final VoidCallback onTap;

  const AnswerOption({
    super.key,
    required this.letter,
    required this.text,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final radius = BorderRadius.circular(context.sp(16));

    return Padding(
      padding: EdgeInsets.only(bottom: context.sp(10)),
      child: Material(
        color: selected ? AppTheme.primary.withOpacity(.12) : cs.surface,
        shape: RoundedRectangleBorder(
          borderRadius: radius,
          side: BorderSide(
            color: selected ? AppTheme.primary : cs.outlineVariant,
            width: selected ? 2 : 1,
          ),
        ),
        child: InkWell(
          borderRadius: radius,
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: context.sp(14),
              vertical: context.sp(12),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: context.sp(17),
                  backgroundColor: selected ? AppTheme.primary : cs.surfaceContainerHighest,
                  child: Text(
                    letter,
                    style: TextStyle(
                      fontSize: context.sp(14),
                      fontWeight: FontWeight.w700,
                      color: selected ? Colors.white : cs.onSurface,
                    ),
                  ),
                ),
                SizedBox(width: context.sp(12)),
                Expanded(
                  child: Text(
                    text,
                    style: TextStyle(fontSize: context.sp(14), fontWeight: FontWeight.w500),
                  ),
                ),
                if (selected)
                  Icon(Icons.check_circle_rounded,
                      color: AppTheme.primary, size: context.sp(22)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}