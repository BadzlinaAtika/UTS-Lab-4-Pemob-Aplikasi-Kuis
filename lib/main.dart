import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/quiz_provider.dart';
import 'providers/theme_provider.dart';
import 'screens/welcome_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(
    // Provider dipasang di paling atas agar state bertahan di semua halaman.
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => QuizProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const KuisApp(),
    ),
  );
}

class KuisApp extends StatelessWidget {
  const KuisApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Mode tema mengikuti pilihan pengguna di ThemeProvider.
    final themeMode = context.watch<ThemeProvider>().mode;
    return MaterialApp(
      title: 'QuizKuy',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: themeMode,
      home: const WelcomeScreen(),
    );
  }
}