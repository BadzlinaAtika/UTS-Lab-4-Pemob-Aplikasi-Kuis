import 'package:flutter/material.dart';
import '../models/quiz_question.dart';
import '../models/subtest.dart';

/// Data dummy lokal: daftar subtes, masing-masing membawa 10 soal.
/// Untuk menambah subtes, tambahkan satu blok Subtest(...) di bawah.
/// correctIndex dimulai dari 0 (0 = A, 1 = B, 2 = C, 3 = D).
const List<Subtest> subtestsData = [
  // ---------------------------------------------------------------- 1
  Subtest(
    id: 'dasar_pemrograman',
    title: 'Dasar Pemrograman',
    description: 'Algoritma, variabel, tipe data, dan perulangan.',
    icon: Icons.code_rounded,
    color: Color(0xFF6C4CFF),
    questions: [
      QuizQuestion(
        text: 'Urutan langkah logis untuk menyelesaikan suatu masalah disebut...',
        options: ['Algoritma', 'Kompilator', 'Variabel', 'Sintaks'],
        correctIndex: 0,
        explanation: 'Algoritma adalah langkah-langkah terurut untuk menyelesaikan masalah.',
      ),
      QuizQuestion(
        text: 'Tempat menyimpan data yang nilainya dapat berubah disebut...',
        options: ['Konstanta', 'Variabel', 'Komentar', 'Fungsi'],
        correctIndex: 1,
        explanation: 'Variabel menyimpan nilai di memori dan nilainya bisa diubah.',
      ),
      QuizQuestion(
        text: 'Tipe data yang hanya bernilai true atau false adalah...',
        options: ['Integer', 'String', 'Boolean', 'Double'],
        correctIndex: 2,
        explanation: 'Boolean hanya memiliki dua nilai, yaitu true dan false.',
      ),
      QuizQuestion(
        text: 'Struktur yang mengulang perintah selama kondisi terpenuhi disebut...',
        options: ['Percabangan', 'Perulangan', 'Deklarasi', 'Import'],
        correctIndex: 1,
        explanation: 'Perulangan (loop) seperti for dan while mengulang blok kode.',
      ),
      QuizQuestion(
        text: 'Proses mencari dan memperbaiki kesalahan pada program disebut...',
        options: ['Compiling', 'Deploying', 'Debugging', 'Coding'],
        correctIndex: 2,
        explanation: 'Debugging adalah menemukan dan memperbaiki bug pada program.',
      ),
      QuizQuestion(
        text: 'Struktur yang memilih perintah berdasarkan suatu kondisi (if-else) disebut...',
        options: ['Perulangan', 'Array', 'Percabangan', 'Fungsi'],
        correctIndex: 2,
        explanation: 'Percabangan menjalankan blok kode yang berbeda sesuai kondisi.',
      ),
      QuizQuestion(
        text: 'Kumpulan data sejenis yang disimpan dalam satu variabel dan diakses dengan indeks disebut...',
        options: ['Array', 'Fungsi', 'Konstanta', 'Kelas'],
        correctIndex: 0,
        explanation: 'Array (atau list) menyimpan banyak nilai yang diakses lewat nomor indeks.',
      ),
      QuizQuestion(
        text: 'Blok kode bernama yang dapat dipanggil berulang kali disebut...',
        options: ['Variabel', 'Komentar', 'Operator', 'Fungsi'],
        correctIndex: 3,
        explanation: 'Fungsi membungkus sekumpulan perintah agar bisa dipakai ulang.',
      ),
      QuizQuestion(
        text: 'Operator % (modulus) pada pemrograman menghasilkan...',
        options: ['Hasil bagi', 'Sisa bagi', 'Persentase', 'Hasil pangkat'],
        correctIndex: 1,
        explanation: 'Operator % menghasilkan sisa pembagian, misalnya 7 % 3 = 1.',
      ),
      QuizQuestion(
        text: 'Tipe data yang digunakan untuk menyimpan teks adalah...',
        options: ['String', 'Integer', 'Boolean', 'Double'],
        correctIndex: 0,
        explanation: 'String menyimpan rangkaian karakter seperti nama atau kalimat.',
      ),
    ],
  ),
  // ---------------------------------------------------------------- 2
  Subtest(
    id: 'pemrograman_mobile',
    title: 'Pemrograman Mobile',
    description: 'Android, Flutter, widget, dan konfigurasi aplikasi.',
    icon: Icons.phone_android_rounded,
    color: Color(0xFFFF5CAA),
    questions: [
      QuizQuestion(
        text: 'Bahasa pemrograman yang digunakan oleh Flutter adalah...',
        options: ['Java', 'Kotlin', 'Dart', 'Swift'],
        correctIndex: 2,
        explanation: 'Flutter dibangun menggunakan bahasa Dart buatan Google.',
      ),
      QuizQuestion(
        text: 'Sistem operasi seluler yang dikembangkan oleh Google adalah...',
        options: ['iOS', 'Android', 'Windows Phone', 'Tizen'],
        correctIndex: 1,
        explanation: 'Android dikembangkan oleh Google dan dipakai di banyak ponsel.',
      ),
      QuizQuestion(
        text: 'Semua elemen tampilan di Flutter disebut...',
        options: ['Fragment', 'Activity', 'Widget', 'Layout'],
        correctIndex: 2,
        explanation: 'Di Flutter, hampir semua tampilan dibangun dari widget.',
      ),
      QuizQuestion(
        text: 'File untuk mendaftarkan aset dan font di Flutter adalah...',
        options: ['main.dart', 'pubspec.yaml', 'AndroidManifest.xml', 'README.md'],
        correctIndex: 1,
        explanation: 'Aset, font, dan dependensi didefinisikan di pubspec.yaml.',
      ),
      QuizQuestion(
        text: 'Satu kode untuk beberapa platform (Android dan iOS) disebut pendekatan...',
        options: ['Cross-platform', 'Standalone', 'Embedded', 'Monolith'],
        correctIndex: 0,
        explanation: 'Cross-platform memungkinkan satu basis kode berjalan di banyak platform.',
      ),
      QuizQuestion(
        text: 'Fitur untuk melihat perubahan kode tanpa memulai ulang aplikasi disebut...',
        options: ['Hot Reload', 'Hot Delete', 'Hot Build', 'Hot Clean'],
        correctIndex: 0,
        explanation: 'Hot Reload memasukkan kode baru ke aplikasi yang sedang berjalan.',
      ),
      QuizQuestion(
        text: 'Widget yang tampilannya tidak berubah setelah dibuat disebut...',
        options: ['StatefulWidget', 'StatelessWidget', 'InheritedWidget', 'AnimatedWidget'],
        correctIndex: 1,
        explanation: 'StatelessWidget bersifat immutable dan tidak punya state internal.',
      ),
      QuizQuestion(
        text: 'Alat yang meniru perangkat seluler di dalam komputer disebut...',
        options: ['Emulator', 'Compiler', 'Debugger', 'Plugin'],
        correctIndex: 0,
        explanation: 'Emulator menjalankan aplikasi seluler tanpa membutuhkan ponsel fisik.',
      ),
      QuizQuestion(
        text: 'Widget untuk menyusun anak secara vertikal adalah...',
        options: ['Row', 'Column', 'Stack', 'Wrap'],
        correctIndex: 1,
        explanation: 'Column menyusun widget anak dari atas ke bawah.',
      ),
      QuizQuestion(
        text: 'Perintah untuk menjalankan aplikasi Flutter dari terminal adalah...',
        options: ['flutter start', 'flutter go', 'flutter launch', 'flutter run'],
        correctIndex: 3,
        explanation: 'flutter run membangun dan menjalankan aplikasi di perangkat.',
      ),
    ],
  ),
  // ---------------------------------------------------------------- 3
  Subtest(
    id: 'matematika_dasar',
    title: 'Matematika Dasar',
    description: 'Operasi hitung, pecahan, persen, dan geometri.',
    icon: Icons.calculate_rounded,
    color: Color(0xFFF59E0B),
    questions: [
      QuizQuestion(
        text: 'Hasil dari 12 × 8 adalah...',
        options: ['86', '96', '106', '88'],
        correctIndex: 1,
        explanation: '12 × 8 = 96.',
      ),
      QuizQuestion(
        text: 'Hasil dari 3/4 + 1/4 adalah...',
        options: ['1/2', '3/8', '1', '4/8'],
        correctIndex: 2,
        explanation: 'Penyebutnya sama, sehingga 3/4 + 1/4 = 4/4 = 1.',
      ),
      QuizQuestion(
        text: 'Luas persegi dengan panjang sisi 7 cm adalah...',
        options: ['49 cm²', '14 cm²', '28 cm²', '56 cm²'],
        correctIndex: 0,
        explanation: 'Luas persegi = sisi × sisi = 7 × 7 = 49 cm².',
      ),
      QuizQuestion(
        text: '25% dari 200 adalah...',
        options: ['25', '40', '75', '50'],
        correctIndex: 3,
        explanation: '25% = 1/4, dan 1/4 × 200 = 50.',
      ),
      QuizQuestion(
        text: 'Akar kuadrat dari 144 adalah...',
        options: ['10', '12', '11', '14'],
        correctIndex: 1,
        explanation: '12 × 12 = 144, jadi akarnya 12.',
      ),
      QuizQuestion(
        text: 'Hasil dari 125 − 47 adalah...',
        options: ['72', '78', '88', '82'],
        correctIndex: 1,
        explanation: '125 − 47 = 78.',
      ),
      QuizQuestion(
        text: 'Keliling persegi panjang dengan panjang 10 cm dan lebar 6 cm adalah...',
        options: ['16 cm', '32 cm', '60 cm', '64 cm'],
        correctIndex: 1,
        explanation: 'Keliling = 2 × (p + l) = 2 × (10 + 6) = 32 cm.',
      ),
      QuizQuestion(
        text: 'Hasil dari 2³ (dua pangkat tiga) adalah...',
        options: ['6', '9', '16', '8'],
        correctIndex: 3,
        explanation: '2³ = 2 × 2 × 2 = 8.',
      ),
      QuizQuestion(
        text: 'KPK (Kelipatan Persekutuan Terkecil) dari 4 dan 6 adalah...',
        options: ['2', '12', '10', '24'],
        correctIndex: 1,
        explanation: 'Kelipatan 4: 4, 8, 12. Kelipatan 6: 6, 12. KPK-nya adalah 12.',
      ),
      QuizQuestion(
        text: 'Rata-rata dari 70, 80, dan 90 adalah...',
        options: ['70', '75', '80', '85'],
        correctIndex: 2,
        explanation: '(70 + 80 + 90) ÷ 3 = 240 ÷ 3 = 80.',
      ),
    ],
  ),
  // ---------------------------------------------------------------- 4
  Subtest(
    id: 'science',
    title: 'Science',
    description: 'Fisika, kimia, biologi, dan sains bumi.',
    icon: Icons.science_rounded,
    color: Color(0xFF22A06B),
    questions: [
      QuizQuestion(
        text: 'Satuan gaya dalam Sistem Internasional (SI) adalah...',
        options: ['Joule', 'Watt', 'Newton', 'Pascal'],
        correctIndex: 2,
        explanation: 'Gaya diukur dalam Newton (N), sesuai Hukum Newton.',
      ),
      QuizQuestion(
        text: 'Rumus kimia air adalah...',
        options: ['CO2', 'H2O', 'O2', 'NaCl'],
        correctIndex: 1,
        explanation: 'Satu molekul air terdiri dari dua atom hidrogen dan satu atom oksigen.',
      ),
      QuizQuestion(
        text: 'Organel sel yang berfungsi menghasilkan energi (ATP) adalah...',
        options: ['Ribosom', 'Nukleus', 'Mitokondria', 'Lisosom'],
        correctIndex: 2,
        explanation: 'Mitokondria disebut "pembangkit tenaga" sel.',
      ),
      QuizQuestion(
        text: 'Gas yang diserap tumbuhan saat fotosintesis adalah...',
        options: ['Karbon dioksida', 'Oksigen', 'Nitrogen', 'Hidrogen'],
        correctIndex: 0,
        explanation: 'Tumbuhan menyerap CO2 dan menghasilkan oksigen serta glukosa.',
      ),
      QuizQuestion(
        text: 'Planet yang paling dekat dengan Matahari adalah...',
        options: ['Venus', 'Bumi', 'Mars', 'Merkurius'],
        correctIndex: 3,
        explanation: 'Merkurius adalah planet terdekat dari Matahari di tata surya.',
      ),
      QuizQuestion(
        text: 'Satuan massa dalam Sistem Internasional (SI) adalah...',
        options: ['Gram', 'Kilogram', 'Newton', 'Liter'],
        correctIndex: 1,
        explanation: 'Satuan pokok massa dalam SI adalah kilogram (kg).',
      ),
      QuizQuestion(
        text: 'Zat hijau pada daun yang berperan dalam fotosintesis adalah...',
        options: ['Klorofil', 'Hemoglobin', 'Melanin', 'Keratin'],
        correctIndex: 0,
        explanation: 'Klorofil menyerap cahaya matahari untuk proses fotosintesis.',
      ),
      QuizQuestion(
        text: 'Gas penyusun terbesar atmosfer Bumi adalah...',
        options: ['Oksigen', 'Nitrogen', 'Argon', 'Karbon dioksida'],
        correctIndex: 1,
        explanation: 'Atmosfer Bumi terdiri dari sekitar 78% nitrogen dan 21% oksigen.',
      ),
      QuizQuestion(
        text: 'Perubahan wujud zat dari cair menjadi gas disebut...',
        options: ['Menguap', 'Membeku', 'Mencair', 'Mengembun'],
        correctIndex: 0,
        explanation: 'Menguap adalah perubahan wujud dari cair menjadi gas.',
      ),
      QuizQuestion(
        text: 'Organ yang berfungsi memompa darah ke seluruh tubuh adalah...',
        options: ['Paru-paru', 'Hati', 'Ginjal', 'Jantung'],
        correctIndex: 3,
        explanation: 'Jantung memompa darah agar beredar ke seluruh tubuh.',
      ),
    ],
  ),
];