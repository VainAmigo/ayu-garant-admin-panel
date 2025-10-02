import 'package:ayu_admin_panel/moduls/report/report.dart';
import 'package:flutter/material.dart';


class ReportContentWidget extends StatelessWidget {
  const ReportContentWidget({
    super.key,
    required this.selectedIndex,
  });

  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    switch (selectedIndex) {
      case 0:
        return const PolicyReportView();
      case 1:
        return const UsersReportView();
      case 2:
        return const AvarReportView();
      case 3:
        return const AccountingReportView();
      default:
        return const PolicyReportView();
    }
  }

}
