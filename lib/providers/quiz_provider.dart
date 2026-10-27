import 'package:flutter/foundation.dart';
import '../models/quiz_question.dart';
import '../models/subtest.dart';

/// State management kuis. Dipasang di atas MaterialApp sehingga nama,
/// subtes terpilih, nomor soal, dan jawaban tidak hilang saat rotasi
/// atau pindah halaman.
class QuizProvider extends ChangeNotifier {
  String _playerName = '';
  Subtest? _subtest;
  int _currentIndex = 0;
  List<int?> _answers = [];

  String get playerName => _playerName;
  Subtest? get subtest => _subtest;

  /// Soal mengikuti subtes yang sedang dipilih.
  List<QuizQuestion> get questions => _subtest?.questions ?? const [];

  int get currentIndex => _currentIndex;
  int get total => questions.length;
  QuizQuestion get currentQuestion => questions[_currentIndex];
  List<int?> get answers => List.unmodifiable(_answers);
  int? get currentAnswer => _answers[_currentIndex];
  bool get isFirst => _currentIndex == 0;
  bool get isLast => _currentIndex == total - 1;
  int get answeredCount => _answers.where((a) => a != null).length;

  /// Ada progres jika sudah ada jawaban tapi kuis belum selesai semua.
  bool get hasProgress => answeredCount > 0 && answeredCount < total;

  /// Apakah subtes [s] sedang dikerjakan dan punya progres?
  bool hasProgressIn(Subtest s) => _subtest?.id == s.id && hasProgress;

  int get score {
    var s = 0;
    for (var i = 0; i < total; i++) {
      if (_answers[i] == questions[i].correctIndex) s++;
    }
    return s;
  }

  int get percent => total == 0 ? 0 : (score / total * 100).round();

  /// Menyimpan nama. Jika nama berubah, progres lama dibuang.
  void setPlayerName(String name) {
    final clean = name.trim();
    if (clean != _playerName) {
      _playerName = clean;
      _subtest = null;
      _answers = [];
      _currentIndex = 0;
    }
    notifyListeners();
  }

  /// Memilih subtes. Jika subtes yang sama masih punya progres, dilanjutkan.
  void selectSubtest(Subtest s) {
    final resume = hasProgressIn(s);
    _subtest = s;
    if (!resume) _resetAnswers();
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
    _answers = List.filled(total, null);
  }
}