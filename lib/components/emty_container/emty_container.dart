import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class EmtyContainer extends StatelessWidget {
  const EmtyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        spacing: AppSpacing.defaultPadding,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.info, size: 48, color: AppColors.grey),
          Text('Нет данных для отображения', style: AppTypography.black32w600),
        ],
      ),
    );
  }
}