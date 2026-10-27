/// Bentuk data satu soal kuis.
class QuizQuestion {
  final String text;
  final List<String> options;
  final int correctIndex;
  final String explanation;

  const QuizQuestion({
    required this.text,
    required this.options,
    required this.correctIndex,
    required this.explanation,
  });
}