import 'package:flutter/material.dart';
import 'quiz_questions.dart';

/// Satu subtes (kategori kuis) beserta soal-soalnya.
class Subtest {
  final String id;
  final String title;
  final String description;
  final IconData icon;
  final Color color;
  final List<QuizQuestion> questions;

  const Subtest({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
    required this.questions,
  });
}