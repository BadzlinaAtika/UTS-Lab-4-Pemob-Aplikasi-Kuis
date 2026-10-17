import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/quiz_providers.dart';
import 'screens/welcome_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(
    // Provider dipasang di paling atas agar state bertahan di semua halaman.
    ChangeNotifierProvider(
      create: (_) => QuizProvider(),
      child: const KuisApp(),
    ),
  );
}

class KuisApp extends StatelessWidget {
  const KuisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuizKuy',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system, // dual-theme manual ditambah nanti
      home: const WelcomeScreen(),
    );
  }
}