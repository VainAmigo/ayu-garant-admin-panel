import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class TextTag extends StatelessWidget {
  const TextTag({
    super.key,
    this.text,
    this.color,
    this.textColor,
    this.textStyle,
    this.icon,
  });

  final String? text;
  final Color? color;
  final Color? textColor;
  final TextStyle? textStyle;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? AppColors.primary25,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: color ?? AppColors.primary25),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: icon != null
          ? Icon(icon, color: textColor ?? AppColors.white, size: 12)
          : Text(
              text ?? '',
              style:
                  textStyle ??
                  AppTypography.grey14w500.copyWith(
                    color: textColor ?? AppColors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 12,
                  ),
              textAlign: TextAlign.center,
            ),
    );
  }
}
