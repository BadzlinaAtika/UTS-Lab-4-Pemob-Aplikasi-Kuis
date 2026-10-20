import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../data/subtests_data.dart';
import '../providers/quiz_providers.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_card.dart';
import '../widgets/gradient_background.dart';
import '../widgets/score_ring.dart';
import '../widgets/subtest_card.dart';
import 'quiz_screen.dart';
import 'welcome_screen.dart';

/// Halaman hasil: skor atas nama pengguna, pilihan subtes lain,
/// dan pembahasan tiap soal.
class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  String _message(int percent) {
    if (percent == 100) return 'Sempurna! Kamu luar biasa 🎉';
    if (percent >= 80) return 'Hebat! Hampir sempurna 👏';
    if (percent >= 60) return 'Bagus! Terus belajar 💪';
    if (percent >= 40) return 'Lumayan, ayo coba lagi 🙂';
    return 'Jangan menyerah, coba lagi! 📚';
  }

  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();
    final cs = Theme.of(context).colorScheme;

    // Subtes lain = semua subtes kecuali yang baru dikerjakan.
    final otherSubtests =
    subtestsData.where((s) => s.id != quiz.subtest?.id).toList();

    return Scaffold(
      body: GradientBackground(
        child: ListView(
          padding: EdgeInsets.all(context.sp(20)),
          children: [
            SizedBox(height: context.sp(16)),
            // Jika trophy.png tidak ada, otomatis diganti ikon piala.
            Center(
              child: Image.asset(
                'assets/images/trophy.png',
                width: context.sp(90),
                height: context.sp(90),
                errorBuilder: (_, __, ___) => Icon(
                  Icons.emoji_events_rounded,
                  size: context.sp(90),
                  color: Colors.amber,
                ),
              ),
            ),
            SizedBox(height: context.sp(8)),
            Text(
              'Skor ${quiz.playerName}',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: context.sp(22), fontWeight: FontWeight.w700),
            ),
            Text(
              quiz.subtest?.title ?? '',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: context.sp(13), color: cs.onSurfaceVariant),
            ),
            SizedBox(height: context.sp(16)),
            Center(child: ScoreRing(score: quiz.score, total: quiz.total)),
            SizedBox(height: context.sp(12)),
            Text(
              '${quiz.percent}% • ${_message(quiz.percent)}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: context.sp(14),
                fontWeight: FontWeight.w500,
                color: cs.onSurfaceVariant,
              ),
            ),
            SizedBox(height: context.sp(20)),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    label: 'Beranda',
                    icon: Icons.home_rounded,
                    outlined: true,
                    onPressed: () {
                      context.read<QuizProvider>().restart();
                      // Hapus semua halaman sebelumnya, lalu ke beranda.
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(builder: (_) => const WelcomeScreen()),
                            (route) => false,
                      );
                    },
                  ),
                ),
                SizedBox(width: context.sp(12)),
                Expanded(
                  child: CustomButton(
                    label: 'Ulangi',
                    icon: Icons.replay_rounded,
                    onPressed: () {
                      context.read<QuizProvider>().restart();
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => const QuizScreen()),
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: context.sp(24)),

            // Pilih subtes lain langsung dari halaman hasil.
            if (otherSubtests.isNotEmpty) ...[
              Text(
                'Coba Subtes Lain',
                style: TextStyle(fontSize: context.sp(16), fontWeight: FontWeight.w700),
              ),
              SizedBox(height: context.sp(10)),
              for (final s in otherSubtests)
                SubtestCard(
                  subtest: s,
                  onTap: () {
                    context.read<QuizProvider>().selectSubtest(s);
                    // Ganti halaman hasil dengan kuis subtes baru, jadi tombol
                    // ✕ di kuis akan kembali ke halaman pilih subtes.
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (_) => const QuizScreen()),
                    );
                  },
                ),
              SizedBox(height: context.sp(12)),
            ],

            Text(
              'Pembahasan',
              style: TextStyle(fontSize: context.sp(16), fontWeight: FontWeight.w700),
            ),
            SizedBox(height: context.sp(10)),
            for (var i = 0; i < quiz.total; i++) ...[
              _buildReview(context, quiz, i),
              SizedBox(height: context.sp(12)),
            ],
          ],
        ),
      ),
    );
  }

  /// Kartu pembahasan satu soal: hijau jika benar, merah jika salah.
  Widget _buildReview(BuildContext context, QuizProvider quiz, int i) {
    final q = quiz.questions[i];
    final answer = quiz.answers[i];
    final correct = answer == q.correctIndex;
    final color = correct ? AppTheme.correct : AppTheme.wrong;

    return CustomCard(
      borderColor: color,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                correct ? Icons.check_circle_rounded : Icons.cancel_rounded,
                color: color,
                size: context.sp(20),
              ),
              SizedBox(width: context.sp(8)),
              Expanded(
                child: Text(
                  '${i + 1}. ${q.text}',
                  style: TextStyle(
                      fontSize: context.sp(13), fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          SizedBox(height: context.sp(8)),
          Text(
            'Jawabanmu: ${answer == null ? '(tidak dijawab)' : q.options[answer]}',
            style: TextStyle(
                fontSize: context.sp(12), color: color, fontWeight: FontWeight.w500),
          ),
          if (!correct)
            Text(
              'Jawaban benar: ${q.options[q.correctIndex]}',
              style: TextStyle(
                  fontSize: context.sp(12),
                  color: AppTheme.correct,
                  fontWeight: FontWeight.w500),
            ),
          SizedBox(height: context.sp(4)),
          Text(
            q.explanation,
            style: TextStyle(
              fontSize: context.sp(11),
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }
}