import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'utils/responsive.dart';
import 'screens/welcome_screen.dart';

void main() => runApp(const KuisApp());

class KuisApp extends StatelessWidget {
  const KuisApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuizKuy',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system, // ikut pengaturan HP/laptop
      home: const WelcomeScreen(),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Column(
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
          style: TextStyle(fontSize: context.sp(30), fontWeight: FontWeight.w700),
        ),
      ],
    );
  }