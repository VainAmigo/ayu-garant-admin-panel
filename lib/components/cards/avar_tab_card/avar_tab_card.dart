import 'package:ayu_admin_panel/components/components.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class AvarTabCard extends StatelessWidget {
  const AvarTabCard({
    super.key,
    required this.title,
    required this.count,
    required this.isActive,
    required this.onTap,
    required this.dotColor,
  });

  final String title;
  final String count;
  final bool isActive;
  final Function() onTap;
  final Color dotColor;

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Dot(color: dotColor),
                const Spacer(),
                Text(
                  count, 
                  style: AppTypography.white32w600.copyWith(
                    color: isActive ? AppColors.white : AppColors.grey,
                  ),
                ),
              ],
            ),
            Spacer(),
            Text(
              title,
              textAlign: TextAlign.left,
              style: isActive
                  ? AppTypography.white24w600
                  : AppTypography.white24w600.copyWith(
                    color: AppColors.grey,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
