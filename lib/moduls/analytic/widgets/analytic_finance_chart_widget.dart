import 'package:ayu_admin_panel/components/components.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class AnalyticFinanceChartWidget extends StatelessWidget {
  const AnalyticFinanceChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(20),
      child: CustomChart(
        size: 250,
        thickness: 60,
        isFinance: true,
        totalPremium: '1 212 234',
        segments: const [
          ChartSegment(label: 'Сумма премии', value: 100123, color: AppColors.primary50),
          ChartSegment(label: 'оплачено бонусами', value: 23422, color: AppColors.primary),
        ],
      ),
    );
  }
}