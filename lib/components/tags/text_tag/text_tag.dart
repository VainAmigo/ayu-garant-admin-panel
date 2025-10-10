import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class TextTag extends StatelessWidget {
  const TextTag({super.key, required this.text, this.color, this.textColor});

  final String text;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? AppColors.primary25,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: color ?? AppColors.primary25),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Text(
        text,
        style: AppTypography.grey14w500.copyWith(
          color: textColor ?? AppColors.white,
          fontWeight: FontWeight.w700,
          fontSize: 12,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
