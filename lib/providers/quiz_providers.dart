import 'package:flutter/foundation.dart';
import '../data/questions_data.dart';
import '../models/quiz_questions.dart';

/// State management kuis. Provider ini dipasang di atas MaterialApp,
/// jadi nama, nomor soal, dan jawaban tidak hilang saat layar dirotasi
/// atau saat pindah halaman.
class QuizProvider extends ChangeNotifier {
  final List<QuizQuestion> questions = questionsData;

  String _playerName = '';
  int _currentIndex = 0;
  late List<int?> _answers = List.filled(questions.length, null);

  String get playerName => _playerName;
  int get currentIndex => _currentIndex;
  int get total => questions.length;
  QuizQuestion get currentQuestion => questions[_currentIndex];
  List<int?> get answers => List.unmodifiable(_answers);
  int? get currentAnswer => _answers[_currentIndex];
  bool get isFirst => _currentIndex == 0;
  bool get isLast => _currentIndex == total - 1;
  int get answeredCount => _answers.where((a) => a != null).length;
  bool get hasProgress => answeredCount > 0;

  int get score {
    var s = 0;
    for (var i = 0; i < total; i++) {
      if (_answers[i] == questions[i].correctIndex) s++;
    }
    return s;
  }

  int get percent => (score / total * 100).round();

  /// Dipanggil saat tombol mulai ditekan. Jika nama sama dan masih ada
  /// progres, kuis dilanjutkan; jika tidak, kuis dimulai dari awal.
  void startQuiz(String name) {
    final sameUser = name.trim() == _playerName;
    _playerName = name.trim();
    if (!(sameUser && hasProgress)) _resetAnswers();
    notifyListeners();
  }

  void select(int optionIndex) {
    _answers[_currentIndex] = optionIndex;
    notifyListeners();
  }

  void next() {
    if (!isLast) {
      _currentIndex++;
      notifyListeners();
    }
  }

  void previous() {
    if (!isFirst) {
      _currentIndex--;
      notifyListeners();
    }
  }

  void restart() {
    _resetAnswers();
    notifyListeners();
  }

  void _resetAnswers() {
    _currentIndex = 0;
    _answers = List.filled(questions.length, null);
  }
}