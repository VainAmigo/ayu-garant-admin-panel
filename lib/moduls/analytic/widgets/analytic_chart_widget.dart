import 'package:ayu_admin_panel/components/components.dart';
import 'package:ayu_admin_panel/config/config.dart';
import 'package:ayu_admin_panel/services/services.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class AnalyticChartWidget extends StatelessWidget {
  final AnalyticEntity analyticData;

  const AnalyticChartWidget({super.key, required this.analyticData});

  @override
  Widget build(BuildContext context) {

    final premiumTotalSum = analyticData.financialData.totalPremiumSum;
    final usedBonuses = analyticData.financialData.usedBonuses;
    final premiumSum = premiumTotalSum - usedBonuses;

    final moneySegments = [
      ChartSegment(
        label: 'Сумма премии',
        value: premiumSum,
        color: AppColors.primary,
      ),
      ChartSegment(
        label: 'Оплачено бонусами',
        value: usedBonuses,
        color: AppColors.primary50,
      ),
    ];

    final policyTypes = analyticData.policyTypes;
    final policySegments = [
      ChartSegment(
        label: 'ОСАГО',
        value: policyTypes.osago.toDouble(),
        color: AppColors.primary,
      ),
      ChartSegment(
        label: 'КАСКО',
        value: policyTypes.kasko.toDouble(),
        color: AppColors.primary50,
      ),
      ChartSegment(
        label: 'КАСКО Мини',
        value: policyTypes.kaskoMini.toDouble(),
        color: AppColors.primary75,
      ),
      ChartSegment(
        label: 'ДСАГО',
        value: policyTypes.dsago.toDouble(),
        color: AppColors.primary25,
      ),
    ];

    return Responsive(
      mobile: AnalyticChartMobile(
        moneySegments: moneySegments,
        policySegments: policySegments,
        title: premiumTotalSum.toString(),
      ),
      tablet: AnalyticChartTablet(
        moneySegments: moneySegments,
        policySegments: policySegments,
        title: premiumTotalSum.toString(),
      ),
      desktop: AnalyticChartDesktop(
        moneySegments: moneySegments,
        policySegments: policySegments,
        title: premiumTotalSum.toString(),
      ),
    );
  }
}

class AnalyticChartMobile extends StatelessWidget {
  final List<ChartSegment> moneySegments;
  final List<ChartSegment> policySegments;
  final String title;

  const AnalyticChartMobile({
    super.key,
    required this.moneySegments,
    required this.policySegments,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20,
      children: [
        Container(
          padding: EdgeInsets.all(AppSpacing.defaultPadding),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            spacing: AppSpacing.defaultPadding,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomChart(segments: policySegments, size: 150, thickness: 30),
              _buildRowLegend(policySegments, title, false),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(AppSpacing.defaultPadding),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            spacing: AppSpacing.defaultPadding,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomChart(segments: moneySegments, size: 150, thickness: 30),
              _buildRowLegend(moneySegments, title, true),
            ],
          ),
        ),
      ],
    );
  }
}

class AnalyticChartTablet extends StatelessWidget {
  final List<ChartSegment> moneySegments;
  final List<ChartSegment> policySegments;
  final String title;

  const AnalyticChartTablet({
    super.key,
    required this.moneySegments,
    required this.policySegments,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.all(AppSpacing.defaultPadding),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomChart(segments: policySegments, size: 150, thickness: 35),
                _buildColumnLegend(policySegments, false, title),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.all(AppSpacing.defaultPadding),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                CustomChart(segments: moneySegments, size: 200, thickness: 40),
                _buildColumnLegend(moneySegments, true, title),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class AnalyticChartDesktop extends StatelessWidget {
  final List<ChartSegment> moneySegments;
  final List<ChartSegment> policySegments;
  final String title;

  const AnalyticChartDesktop({
    super.key,
    required this.moneySegments,
    required this.policySegments,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 20,
      children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: EdgeInsets.all(AppSpacing.defaultPadding),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomChart(segments: policySegments, size: 150, thickness: 40),
                _buildColumnLegend(policySegments, false, title),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            padding: EdgeInsets.all(AppSpacing.defaultPadding),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomChart(segments: moneySegments, size: 150, thickness: 40),
                _buildRowLegend(moneySegments, title, true),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

Widget _buildColumnLegend(
  List<ChartSegment> segments,
  bool isMoney,
  String title,
) {
  return Column(
    spacing: 10,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      isMoney ? _buildTopTitle(title) : SizedBox.shrink(),
      ...segments.map((segment) {
        return Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Dot(color: segment.color),
            const SizedBox(width: 8),
            Text(
              '${segment.label}:',
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            Text(
              segment.value.toString(),
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
            ),
          ],
        );
      }),
    ],
  );
}

Widget _buildRowLegend(
  List<ChartSegment> segments,
  String title,
  bool isMoney,
) {
  return Expanded(
    child: Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        isMoney ? _buildTopTitle(title) : SizedBox.shrink(),
        ...segments.map((segment) {
          return Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Dot(color: segment.color),
              const SizedBox(width: 6),
              Text(
                '${segment.label}:',
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const Spacer(),
              Text(
                segment.value.toString(),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          );
        }),
      ],
    ),
  );
}

Widget _buildTopTitle(String title) {
  return Column(
    mainAxisSize: MainAxisSize.max,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Text('$title c', style: AppTypography.black32w600),
      Text('Сумма премии', style: AppTypography.grey16w500),
      const SizedBox(height: 10),
    ],
  );
}
