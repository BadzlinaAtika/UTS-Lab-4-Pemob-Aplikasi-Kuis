import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';

/// Tombol yang dipakai di semua halaman.
/// [outlined] = true untuk tombol sekunder (hanya garis tepi).
class CustomButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final VoidCallback? onPressed;
  final bool outlined;

  const CustomButton({
    super.key,
    required this.label,
    this.icon,
    this.onPressed,
    this.outlined = false,
  });

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(context.sp(16));
    final enabled = onPressed != null;
    final padding = EdgeInsets.symmetric(
      vertical: context.sp(14),
      horizontal: context.sp(16),
    );

    Widget content(Color color) => Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (icon != null) ...[
          Icon(icon, size: context.sp(20), color: color),
          SizedBox(width: context.sp(8)),
        ],
        Flexible(
          child: Text(
            label,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: context.sp(15),
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ),
      ],
    );

    if (outlined) {
      return OutlinedButton(
        onPressed: onPressed,
        style: OutlinedButton.styleFrom(
          padding: padding,
          shape: RoundedRectangleBorder(borderRadius: radius),
          side: BorderSide(
            color: enabled ? AppTheme.primary : Colors.grey.withOpacity(.4),
            width: 1.5,
          ),
        ),
        child: content(enabled ? AppTheme.primary : Colors.grey),
      );
    }

    return Opacity(
      opacity: enabled ? 1 : .5,
      child: Material(
        color: Colors.transparent,
        borderRadius: radius,
        child: Ink(
          decoration: BoxDecoration(
            borderRadius: radius,
            gradient: const LinearGradient(colors: [AppTheme.primary, AppTheme.accent]),
          ),
          child: InkWell(
            borderRadius: radius,
            onTap: onPressed,
            child: Padding(padding: padding, child: content(Colors.white)),
          ),
        ),
      ),
    );
  }
}