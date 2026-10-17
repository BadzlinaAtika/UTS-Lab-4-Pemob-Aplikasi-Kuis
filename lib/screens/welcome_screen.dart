import 'package:flutter/material.dart';
import '../providers/quiz_providers.dart';
import 'package:provider/provider.dart';
import '../utils/responsive.dart';
import '../widgets/custom_button.dart';
import '../widgets/gradient_background.dart';
import 'quiz_screen.dart';

/// Halaman 1: sambutan + input nama.
/// StatefulWidget karena memakai TextEditingController dan validasi form.
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  late final TextEditingController _controller;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // Isi otomatis dengan nama sebelumnya (jika ada).
    _controller = TextEditingController(text: context.read<QuizProvider>().playerName);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _start() {
    if (!_formKey.currentState!.validate()) return;
    FocusScope.of(context).unfocus();
    context.read<QuizProvider>().startQuiz(_controller.text);
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const QuizScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final quiz = context.watch<QuizProvider>();
    final cs = Theme.of(context).colorScheme;
    final canResume = quiz.hasProgress && quiz.playerName.isNotEmpty;

    return Scaffold(
      body: GradientBackground(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(context.sp(20)),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(context.sp(28)),
                    child: Image.asset(
                      'assets/images/logo.png',
                      width: context.sp(130),
                      height: context.sp(130),
                    ),
                  ),
                  SizedBox(height: context.sp(16)),
                  Text(
                    'QuizKuy',
                    style: TextStyle(
                        fontSize: context.sp(30), fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: context.sp(6)),
                  Text(
                    'Uji pengetahuanmu dengan ${quiz.total} pertanyaan pilihan ganda!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: context.sp(13), color: cs.onSurfaceVariant),
                  ),
                  SizedBox(height: context.sp(28)),
                  TextFormField(
                    controller: _controller,
                    textCapitalization: TextCapitalization.words,
                    textInputAction: TextInputAction.done,
                    maxLength: 20,
                    style: TextStyle(
                        fontSize: context.sp(15), fontWeight: FontWeight.w500),
                    onFieldSubmitted: (_) => _start(),
                    validator: (v) => (v == null || v.trim().isEmpty)
                        ? 'Nama tidak boleh kosong'
                        : null,
                    decoration: InputDecoration(
                      labelText: 'Nama kamu',
                      prefixIcon: const Icon(Icons.person_rounded),
                      filled: true,
                      fillColor: cs.surface,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(context.sp(16)),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  SizedBox(height: context.sp(12)),
                  SizedBox(
                    width: double.infinity,
                    child: CustomButton(
                      label: canResume ? 'Lanjutkan Kuis' : 'Mulai Kuis',
                      icon: Icons.play_arrow_rounded,
                      onPressed: _start,
                    ),
                  ),
                  if (canResume) ...[
                    SizedBox(height: context.sp(10)),
                    Text(
                      'Progres tersimpan: ${quiz.answeredCount}/${quiz.total} terjawab',
                      style: TextStyle(fontSize: context.sp(12), color: cs.primary),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}