import 'package:ayu_admin_panel/components/components.dart';
import 'package:ayu_admin_panel/config/config.dart';
import 'package:ayu_admin_panel/moduls/reports/view/reports_view.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class ReportsTabsWidget extends StatelessWidget {
  const ReportsTabsWidget({
    super.key,
    required this.selectedReport,
    required this.onReportSelected,
  });

  final ReportType selectedReport;
  final Function(ReportType) onReportSelected;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Responsive(
      mobile: ReportsTabsGridView(
        crossAxisCount: 2,
        childAspectRatio: size.width < 610 ? 1.2 : 2.5,
        selectedReport: selectedReport,
        onReportSelected: onReportSelected,
      ),
      tablet: ReportsTabsGridView(
        crossAxisCount: 4,
        childAspectRatio: size.width < 900 ? 1.2 : 1.5,
        selectedReport: selectedReport,
        onReportSelected: onReportSelected,
      ),
      desktop: ReportsTabsGridView(
        crossAxisCount: 4,
        childAspectRatio: 1.5,
        selectedReport: selectedReport,
        onReportSelected: onReportSelected,
      ),
    );
  }
}

class ReportsTabsGridView extends StatelessWidget {
  const ReportsTabsGridView({
    super.key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1.4,
    required this.selectedReport,
    required this.onReportSelected,
  });

  final int crossAxisCount;
  final double childAspectRatio;
  final ReportType selectedReport;
  final Function(ReportType) onReportSelected;

  @override
  Widget build(BuildContext context) {
    return GridView(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        childAspectRatio: childAspectRatio,
        crossAxisSpacing: AppSpacing.defaultPadding,
        mainAxisSpacing: AppSpacing.defaultPadding,
      ),
      children: ReportType.values.map((reportType) {
        return ReportTabCard(
          title: reportType.title,
          icon: reportType.icon,
          isActive: selectedReport == reportType,
          onTap: () => onReportSelected(reportType),
        );
      }).toList(),
    );
  }
}
