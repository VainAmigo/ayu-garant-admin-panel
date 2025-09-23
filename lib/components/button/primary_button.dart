import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    this.text,
    this.icon,
    this.onPressed,
  });

  final String? text;
  final IconData? icon;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        alignment: Alignment.center,
        elevation: null,
        foregroundColor: AppColors.white,
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        textStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
        ),
        disabledBackgroundColor: AppColors.primary.withValues(alpha: 0.3),
        disabledForegroundColor: AppColors.white,
      ),
      onPressed: onPressed, 
      child: icon == null ? Text(text ?? '') : Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: AppColors.white,
            size: 20,
          ),
          const SizedBox(width: 10),
          Text(text ?? ''),
        ],
      )
    );
  }
}
