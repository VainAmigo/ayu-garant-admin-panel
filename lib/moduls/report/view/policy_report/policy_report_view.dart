import 'package:ayu_admin_panel/components/table/table.dart';
import 'package:ayu_admin_panel/moduls/report/report.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class PolicyReportView extends StatelessWidget {
  const PolicyReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReportFilterWidget(),
        const SizedBox(height: 20),
        SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReportListTopWidget(count: _getSampleData().length),
                const SizedBox(height: 20),
                TableListWidget(
                  data: _getSampleData(),
                  config: TableConfigManager.policyReport,
                  onRowTap: (rowData) {
                    print('Выбрана строка: ${rowData['policyNumber']}');
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  /// Пример данных для тестирования
  List<Map<String, dynamic>> _getSampleData() {
    return PolicyDataGenerator.generateMapList(20);
  }
}