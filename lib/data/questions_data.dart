import '../models/quiz_questions.dart';

/// Data dummy lokal (tanpa database).
const List<QuizQuestion> questionsData = [
  QuizQuestion(
    text: 'Bahasa pemrograman yang digunakan oleh Flutter adalah...',
    options: ['Java', 'Kotlin', 'Dart', 'Swift'],
    correctIndex: 2,
    explanation: 'Flutter dibangun menggunakan bahasa Dart buatan Google.',
  ),
  QuizQuestion(
    text: 'Widget yang tampilannya tidak berubah setelah dibuat disebut...',
    options: ['StatefulWidget', 'StatelessWidget', 'InheritedWidget', 'AnimatedWidget'],
    correctIndex: 1,
    explanation: 'StatelessWidget bersifat immutable dan tidak punya state internal.',
  ),
  QuizQuestion(
    text: 'Method untuk memperbarui UI pada StatefulWidget adalah...',
    options: ['refresh()', 'update()', 'setState()', 'rebuild()'],
    correctIndex: 2,
    explanation: 'setState() memberi tahu framework bahwa state berubah dan UI perlu dibangun ulang.',
  ),
  QuizQuestion(
    text: 'Widget untuk menyusun anak secara vertikal adalah...',
    options: ['Row', 'Column', 'Stack', 'Wrap'],
    correctIndex: 1,
    explanation: 'Column menyusun widget anak dari atas ke bawah.',
  ),
  QuizQuestion(
    text: 'File untuk mendaftarkan aset dan font di Flutter adalah...',
    options: ['main.dart', 'pubspec.yaml', 'AndroidManifest.xml', 'analysis_options.yaml'],
    correctIndex: 1,
    explanation: 'Aset, font, dan dependensi didefinisikan di pubspec.yaml.',
  ),
  QuizQuestion(
    text: 'Package yang umum dipakai untuk state management sederhana adalah...',
    options: ['http', 'provider', 'intl', 'path'],
    correctIndex: 1,
    explanation: 'Provider membungkus InheritedWidget agar state mudah dibagikan.',
  ),
  QuizQuestion(
    text: 'Widget untuk menumpuk widget satu di atas yang lain adalah...',
    options: ['Stack', 'ListView', 'Column', 'Expanded'],
    correctIndex: 0,
    explanation: 'Stack menumpuk anak-anaknya pada sumbu Z.',
  ),
  QuizQuestion(
    text: 'Untuk berpindah ke halaman baru kita memakai...',
    options: ['Navigator.push', 'Navigator.exit', 'Scaffold.open', 'Route.jump'],
    correctIndex: 0,
    explanation: 'Navigator.push menambahkan route baru ke tumpukan navigasi.',
  ),
  QuizQuestion(
    text: 'MediaQuery.of(context).size digunakan untuk...',
    options: ['Mengambil data API', 'Mengetahui ukuran layar', 'Mengganti tema', 'Menyimpan data'],
    correctIndex: 1,
    explanation: 'MediaQuery memberi informasi ukuran dan orientasi layar.',
  ),
  QuizQuestion(
    text: 'Perintah untuk menjalankan aplikasi Flutter dari terminal adalah...',
    options: ['flutter start', 'flutter run', 'flutter go', 'flutter launch'],
    correctIndex: 1,
    explanation: 'flutter run membangun dan menjalankan aplikasi di perangkat.',
  ),
];