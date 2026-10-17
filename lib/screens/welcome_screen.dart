import 'package:flutter/material.dart';
import '../utils/responsive.dart';
import '../widgets/custom_button.dart';
import '../widgets/gradient_background.dart';

/// Halaman 1: sambutan + input nama.
/// StatefulWidget karena memakai TextEditingController dan validasi form.
class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _start() {
    if (!_formKey.currentState!.validate()) return;
    FocusScope.of(context).unfocus();
    // Sementara: tampilkan pesan. Navigasi ke halaman kuis dibuat nanti.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Halo, ${_controller.text.trim()}! Kuis segera dimulai.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

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
                  Image.asset(
                    'assets/images/logo.png',
                    width: context.sp(130),
                    height: context.sp(130),
                  ),
                  SizedBox(height: context.sp(16)),
                  Text(
                    'QuizKuy',
                    style: TextStyle(
                        fontSize: context.sp(30), fontWeight: FontWeight.w700),
                  ),
                  SizedBox(height: context.sp(6)),
                  Text(
                    'Uji pengetahuanmu dengan pertanyaan pilihan ganda!',
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
                      label: 'Mulai Kuis',
                      icon: Icons.play_arrow_rounded,
                      onPressed: _start,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}