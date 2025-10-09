import 'package:ayu_admin_panel/moduls/moduls.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class ReportsView extends StatefulWidget {
  const ReportsView({super.key});

  @override
  State<ReportsView> createState() => _ReportsViewState();
}

class _ReportsViewState extends State<ReportsView> {
  ReportType _selectedReport = ReportType.policies;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.defaultPadding),
          child: Column(
            spacing: AppSpacing.defaultPadding,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReportsTabsWidget(
                selectedReport: _selectedReport,
                onReportSelected: _selectReport,
              ),
              _buildReportContent(),
            ],
          ),
        ),
      ),
    );
  }

  void _selectReport(ReportType reportType) {
    setState(() {
      _selectedReport = reportType;
    });
  }

  Widget _buildReportContent() {
    switch (_selectedReport) {
      case ReportType.policies:
        return PolicyReportView();
      case ReportType.users:
        return UserReportView();
      case ReportType.emergencyCommissioner:
        return EmergencyComReportView();
      case ReportType.accounting:
        return AccountingReportView();
    }
  }
}

enum ReportType {
  policies('Отчет по полисам', Icons.file_present),
  users('Отчет по пользователям', Icons.people),
  emergencyCommissioner('Отчет для аварийного комисара', Icons.emergency),
  accounting('Отчет для бухгалтерии', Icons.account_balance);

  const ReportType(this.title, this.icon);
  final String title;
  final IconData icon;
}
