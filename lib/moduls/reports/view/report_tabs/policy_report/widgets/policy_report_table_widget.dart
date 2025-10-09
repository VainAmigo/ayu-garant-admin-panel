import 'package:ayu_admin_panel/components/components.dart';
import 'package:ayu_admin_panel/core/core.dart';
import 'package:ayu_admin_panel/services/services.dart';
import 'package:flutter/material.dart';

class PolicyReportTableWidget extends StatelessWidget {
  const PolicyReportTableWidget({super.key, required this.data, this.onExport});

  final List<PolicyReportEntity> data;
  final Function()? onExport;

  @override
  Widget build(BuildContext context) {
    final columns = [
      TableColumn<PolicyReportEntity>(
        title: 'Номер полиса',
        dataExtractor: (item) => item.policyNumber,
        width: 100,
      ),
      TableColumn<PolicyReportEntity>(
        title: 'Дата оформления',
        dataExtractor: (item) => item.creationDate.formatted,
        width: 80,
      ),
      TableColumn<PolicyReportEntity>(
        title: 'Период действия',
        dataExtractor: (item) =>
            '${item.startDate.formatted} - ${item.endDate.formatted}',
        width: 150,
      ),
      TableColumn<PolicyReportEntity>(
        title: 'Сумма',
        dataExtractor: (item) => '${item.policyCost.toStringAsFixed(2)} c',
        width: 70,
      ),
      TableColumn<PolicyReportEntity>(
        title: 'Тип полиса',
        dataExtractor: (item) => getTranslatePolicyType(item.policyType),
        width: 80,
      ),
      TableColumn<PolicyReportEntity>(
        title: 'Автомобиль',
        dataExtractor: (item) => '${item.brand} ${item.model}',
        width: 200,
      ),
      TableColumn<PolicyReportEntity>(
        title: 'Владелец',
        dataExtractor: (item) => item.policyHolderName,
        width: 200,
      ),
    ];

    return CustomTable<PolicyReportEntity>(
      columns: columns,
      data: data,
      enableHorizontalScroll: true,
      minWidth: 1200,
      onExport: onExport,
    );
  }

  String getTranslatePolicyType(String type) {
    switch (type.toUpperCase()) {
      case 'OSAGO':
        return 'ОСАГО';
      case 'KASKO':
        return 'КАСКО';
      case 'KASKO_MINI':
        return 'КАСКО-мини';
      case 'DSAGO':
        return 'ДСАГО';
      default:
        return type;
    }
  }
}
