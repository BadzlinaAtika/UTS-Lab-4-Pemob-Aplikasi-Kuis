import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/quiz_providers.dart';
import '../utils/responsive.dart';
import '../widgets/answer_option.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_card.dart';
import '../widgets/gradient_background.dart';
import '../widgets/quiz_progress_bar.dart';
import 'result_screen.dart';

/// Halaman 2: menjawab soal.
/// StatelessWidget karena semua state disimpan di QuizProvider,
/// sehingga progres aman saat layar dirotasi.
class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  static const _letters = ['A', 'B', 'C', 'D', 'E', 'F'];

  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();
    final question = quiz.currentQuestion;
    final answer = quiz.currentAnswer;

    return Scaffold(
      body: GradientBackground(
        child: Column(
          children: [
            // Tombol keluar (progres tetap tersimpan di provider)
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                tooltip: 'Kembali ke beranda',
                iconSize: context.sp(26),
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close_rounded),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.sp(20)),
              child: QuizProgressBar(
                name: quiz.playerName,
                current: quiz.currentIndex + 1,
                total: quiz.total,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(context.sp(20)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Pertanyaan ${quiz.currentIndex + 1}',
                            style: TextStyle(
                              fontSize: context.sp(12),
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          SizedBox(height: context.sp(8)),
                          Text(
                            question.text,
                            style: TextStyle(
                              fontSize: context.sp(17),
                              fontWeight: FontWeight.w600,
                              height: 1.4,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: context.sp(16)),
                    for (var i = 0; i < question.options.length; i++)
                      AnswerOption(
                        letter: _letters[i],
                        text: question.options[i],
                        selected: answer == i,
                        onTap: () => context.read<QuizProvider>().select(i),
                      ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(
                  context.sp(20), 0, context.sp(20), context.sp(16)),
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      label: 'Kembali',
                      icon: Icons.arrow_back_rounded,
                      outlined: true,
                      onPressed:
                      quiz.isFirst ? null : context.read<QuizProvider>().previous,
                    ),
                  ),
                  SizedBox(width: context.sp(12)),
                  Expanded(
                    child: CustomButton(
                      label: quiz.isLast ? 'Selesai' : 'Lanjut',
                      icon: quiz.isLast
                          ? Icons.flag_rounded
                          : Icons.arrow_forward_rounded,
                      // Tombol baru aktif setelah soal dijawab
                      onPressed: answer == null
                          ? null
                          : quiz.isLast
                      // Sementara (commit E): tampilkan skor lewat SnackBar.
                          ? () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const ResultScreen()),
                      )
                          : context.read<QuizProvider>().next,
                    ),
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