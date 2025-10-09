import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class ReportTabCard extends StatelessWidget {
  const ReportTabCard({
    super.key,
    required this.title,
    required this.icon,
    required this.isActive,
    required this.onTap,
    this.iconSize = 100,
  });

  final String title;
  final IconData icon;
  final bool isActive;
  final Function() onTap;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? AppColors.primary : AppColors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: EdgeInsets.all(AppSpacing.defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: isActive ? AppColors.white : AppColors.grey,
              size: iconSize,
            ),
            Spacer(),
            Text(
              title,
              textAlign: TextAlign.center,
              style: isActive
                  ? AppTypography.white14w500
                  : AppTypography.grey14w500,
            ),
          ],
        ),
      ),
    );
  }
}
