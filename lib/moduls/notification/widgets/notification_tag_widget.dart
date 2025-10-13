import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class NotificationTagWidget extends StatelessWidget {
  const NotificationTagWidget({
    super.key,
    this.text,
    this.backgroundColor,
    this.textColor,
    this.icon,
    this.onTap,
  });

  final String? text;
  final Color? backgroundColor;
  final Color? textColor;
  final IconData? icon;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 30,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: backgroundColor ?? AppColors.grey100,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: text != null
              ? Text(
                  text ?? '',
                  style: AppTypography.grey14w500.copyWith(
                    fontSize: 12,
                    color: textColor ?? AppColors.grey,
                  ),
                )
              : Icon(icon, color: textColor ?? AppColors.grey, size: 15),
        ),
      ),
    );
  }
}
