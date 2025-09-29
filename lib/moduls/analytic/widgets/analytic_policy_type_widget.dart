import 'package:ayu_admin_panel/components/components.dart';
import 'package:ayu_admin_panel/themes/colors/app_colors.dart';
import 'package:flutter/material.dart';

class AnalyticPolicyTypeWidget extends StatelessWidget {
  const AnalyticPolicyTypeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(20),
      child: CustomChart(
        segments: const [
          ChartSegment(label: 'ОСАГО', value: 16, color: AppColors.primary50),
          ChartSegment(label: 'КАСКО', value: 0, color: AppColors.primary),
          ChartSegment(label: 'КАСКО-мини', value: 2, color: AppColors.primary75),
        ],
      ),
    );
  }
}