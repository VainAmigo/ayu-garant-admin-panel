import 'package:ayu_admin_panel/components/components.dart';
import 'package:ayu_admin_panel/config/config.dart';
import 'package:ayu_admin_panel/moduls/moduls.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class AnalyticView extends StatelessWidget {
  const AnalyticView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.defaultPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(),
              const SizedBox(height: AppSpacing.defaultPadding),

              Row(
                spacing: 20,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      children: [
                        // AnalyticFilter(),
                        // const SizedBox(height: AppSpacing.defaultPadding),
                        AnlyticCardsRow(analyticData: analyticData),
                        const SizedBox(height: AppSpacing.defaultPadding),

                        // AnalyticSystemStat(
                        //   androidPercentage: 10.0,
                        //   iosPercentage: 90.0,
                        // ),
                        // const SizedBox(height: AppSpacing.defaultPadding),
                        // AnalyticPolicyTypeWidget()
                      ],
                    ),
                  ),
                  if (!Responsive.isMobile(context))
                    Expanded(flex: 1, child: AnalyticFinanceChartWidget()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


final List<Map<String, dynamic>> analyticData = [
  {
    'policyTypes': [
      {'type': 'КАСКО', 'count': 120},
      {'type': 'ОСАГО', 'count': 340},
      {'type': 'Здоровье', 'count': 80},
      {'type': 'Имущество', 'count': 45},
    ],
    'systems': {
      'android': 65, // в процентах
      'ios': 35,     // в процентах
    },
    'premiumSum': 1250000.0, // сумма премии за всё время
    'usedBonuses': 250000.0, // сумма использованных бонусов
    'accruedPoints': 54000,  // сумма начисленных баллов
    'totalPolicies': 585,    // количество купленных полисов за всё время
    'policiesToday': 12,     // количество купленных полисов за сегодня
  },
];
