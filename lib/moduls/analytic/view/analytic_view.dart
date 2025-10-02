import 'package:ayu_admin_panel/moduls/moduls.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class AnalyticView extends StatelessWidget {
  const AnalyticView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey100,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AnalyticFilter(),
        
              const SizedBox(height: 20),
        
              AnlyticCardsRow(),
        
              const SizedBox(height: 20),
        
              AnalyticSystemStat(androidPercentage: 10.0, iosPercentage: 90.0),
        
              const SizedBox(height: 20),
        
              Row(crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 20,
                children: [
                  Expanded(child: AnalyticPolicyTypeWidget()),
                  Expanded(child: AnalyticFinanceChartWidget()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
