import 'package:flutter/material.dart';
import '../models/subtest.dart';
import '../utils/responsive.dart';

/// Kartu satu subtes. [statusText] opsional, misalnya "Lanjutkan • 3/5".
class SubtestCard extends StatelessWidget {
  final Subtest subtest;
  final String? statusText;
  final VoidCallback onTap;

  const SubtestCard({
    super.key,
    required this.subtest,
    required this.onTap,
    this.statusText,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final radius = BorderRadius.circular(context.sp(20));

    return Padding(
      padding: EdgeInsets.only(bottom: context.sp(12)),
      child: Material(
        color: cs.surface,
        elevation: 2,
        shadowColor: Colors.black26,
        borderRadius: radius,
        child: InkWell(
          borderRadius: radius,
          onTap: onTap,
          child: Padding(
            padding: EdgeInsets.all(context.sp(14)),
            child: Row(
              children: [
                Container(
                  width: context.sp(54),
                  height: context.sp(54),
                  decoration: BoxDecoration(
                    color: subtest.color.withOpacity(.15),
                    borderRadius: BorderRadius.circular(context.sp(16)),
                  ),
                  child: Icon(subtest.icon, color: subtest.color, size: context.sp(28)),
                ),
                SizedBox(width: context.sp(14)),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        subtest.title,
                        style: TextStyle(
                            fontSize: context.sp(15), fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: context.sp(2)),
                      Text(
                        subtest.description,
                        style: TextStyle(
                            fontSize: context.sp(12), color: cs.onSurfaceVariant),
                      ),
                      SizedBox(height: context.sp(6)),
                      Text(
                        statusText ?? '${subtest.questions.length} soal',
                        style: TextStyle(
                          fontSize: context.sp(12),
                          fontWeight: FontWeight.w600,
                          color: subtest.color,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.chevron_right_rounded, size: context.sp(26)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}