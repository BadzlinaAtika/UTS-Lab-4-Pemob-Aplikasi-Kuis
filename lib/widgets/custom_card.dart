import 'package:flutter/material.dart';
import '../utils/responsive.dart';

/// Kartu pembungkus konten. Dipakai untuk kartu soal dan kartu pembahasan.
/// [borderColor] opsional, untuk memberi garis tepi berwarna di sekeliling kartu.
class CustomCard extends StatelessWidget {
  final Widget child;
  final Color? borderColor;

  const CustomCard({super.key, required this.child, this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(context.sp(16)),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(context.sp(20)),
        border: borderColor == null ? null : Border.all(color: borderColor!, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.08),
            blurRadius: context.sp(16),
            offset: Offset(0, context.sp(6)),
          ),
        ],
      ),
      child: child,
    );
  }
}