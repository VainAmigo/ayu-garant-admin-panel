import 'package:ayu_admin_panel/components/components.dart';
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
                        AnalyticFilter(),
                        const SizedBox(height: AppSpacing.defaultPadding),
                        AnlyticCardsRow(),
                        const SizedBox(height: AppSpacing.defaultPadding),

                        AnalyticSystemStat(
                          androidPercentage: 10.0,
                          iosPercentage: 90.0,
                        ),
                        const SizedBox(height: AppSpacing.defaultPadding),
                        AnalyticPolicyTypeWidget()
                      ],
                    ),
                  ),
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
