import 'package:flutter/material.dart';
import '../models/quiz_questions.dart';
import '../models/subtest.dart';

/// Data dummy lokal: daftar subtes, masing-masing membawa soalnya sendiri.
/// Untuk menambah subtes, tambahkan satu blok Subtest(...) di bawah.
const List<Subtest> subtestsData = [
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
    ],
  ),
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
    ],
  ),
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
        options: ['14 cm²', '28 cm²', '49 cm²', '56 cm²'],
        correctIndex: 2,
        explanation: 'Luas persegi = sisi × sisi = 7 × 7 = 49 cm².',
      ),
      QuizQuestion(
        text: '25% dari 200 adalah...',
        options: ['25', '40', '50', '75'],
        correctIndex: 2,
        explanation: '25% = 1/4, dan 1/4 × 200 = 50.',
      ),
      QuizQuestion(
        text: 'Akar kuadrat dari 144 adalah...',
        options: ['10', '11', '12', '14'],
        correctIndex: 2,
        explanation: '12 × 12 = 144, jadi akarnya 12.',
      ),
    ],
  ),
  Subtest(
    id: 'science',
    title: 'Science (IPA SMA)',
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
        options: ['Oksigen', 'Nitrogen', 'Karbon dioksida', 'Hidrogen'],
        correctIndex: 2,
        explanation: 'Tumbuhan menyerap CO2 dan menghasilkan oksigen serta glukosa.',
      ),
      QuizQuestion(
        text: 'Planet yang paling dekat dengan Matahari adalah...',
        options: ['Venus', 'Bumi', 'Mars', 'Merkurius'],
        correctIndex: 3,
        explanation: 'Merkurius adalah planet terdekat dari Matahari di tata surya.',
      ),
    ],
  ),
];