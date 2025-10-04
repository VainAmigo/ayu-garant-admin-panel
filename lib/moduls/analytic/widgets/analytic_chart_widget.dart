import 'package:ayu_admin_panel/components/components.dart';
import 'package:ayu_admin_panel/config/config.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class AnalyticChartWidget extends StatelessWidget {
  final List<Map<String, dynamic>> analyticData;

  const AnalyticChartWidget({super.key, required this.analyticData});

  @override
  Widget build(BuildContext context) {
    final data = analyticData.first;

    final premiumTotalSum = (data['premiumSum'] ?? 0).toDouble();
    final usedBonuses = (data['usedBonuses'] ?? 0).toDouble();
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

    final policyTypes = data['policyTypes'] as List<dynamic>? ?? [];
    final policySegments = policyTypes.map((policy) {
      return ChartSegment(
        label: policy['type'] ?? '',
        value: (policy['count'] ?? 0).toDouble(),
        color: _getPolicyTypeColor(policy['type']),
      );
    }).toList();

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

  Color _getPolicyTypeColor(String type) {
    switch (type) {
      case 'КАСКО':
        return AppColors.primary;
      case 'ОСАГО':
        return AppColors.primary50;
      case 'Здоровье':
        return AppColors.primary75;
      default:
        return AppColors.grey;
    }
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
