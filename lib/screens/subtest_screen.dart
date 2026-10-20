import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/subtests_data.dart';
import '../providers/quiz_providers.dart';
import '../utils/responsive.dart';
import '../widgets/gradient_background.dart';
import '../widgets/subtest_card.dart';
import 'quiz_screen.dart';

/// Halaman 2: memilih subtes. Semua subtes memakai QuizScreen yang sama,
/// hanya soalnya yang berbeda.
class SubtestScreen extends StatelessWidget {
  const SubtestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();
    final cs = Theme.of(context).colorScheme;

    return Scaffold(
      body: GradientBackground(
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                tooltip: 'Kembali',
                iconSize: context.sp(26),
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back_rounded),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.sp(20)),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Halo, ${quiz.playerName}! 👋',
                      style: TextStyle(
                          fontSize: context.sp(22), fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: context.sp(4)),
                    Text(
                      'Pilih subtes yang ingin kamu kerjakan.',
                      style: TextStyle(
                          fontSize: context.sp(13), color: cs.onSurfaceVariant),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: context.sp(16)),
            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(horizontal: context.sp(20)),
                children: [
                  for (final s in subtestsData)
                    SubtestCard(
                      subtest: s,
                      statusText: quiz.hasProgressIn(s)
                          ? 'Lanjutkan • ${quiz.answeredCount}/${quiz.total}'
                          : null,
                      onTap: () {
                        context.read<QuizProvider>().selectSubtest(s);
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => const QuizScreen()),
                        );
                      },
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