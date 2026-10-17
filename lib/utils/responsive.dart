import 'dart:math' as math;
import 'package:flutter/material.dart';

/// Helper ukuran dinamis berdasarkan ukuran layar (MediaQuery),
/// supaya ukuran elemen UI tidak di-hardcode.
extension ResponsiveX on BuildContext {
  Size get screen => MediaQuery.sizeOf(this);

  /// Lebar konten: 92% layar, tapi dibatasi agar tetap rapi di tablet / web.
  double get contentWidth => math.min(screen.width * 0.92, 600.0);

  /// Faktor skala. Memakai sisi terpendek layar supaya mode landscape
  /// di ponsel tidak membuat elemen terlalu besar.
  double get scale => (screen.shortestSide / 375).clamp(0.85, 1.4).toDouble();

  /// Mengubah nilai (padding, ikon, font, radius) mengikuti skala layar.
  double sp(double value) => value * scale;
}