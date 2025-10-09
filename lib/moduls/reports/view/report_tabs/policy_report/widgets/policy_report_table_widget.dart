import 'package:ayu_admin_panel/components/components.dart';
import 'package:ayu_admin_panel/config/config.dart';
import 'package:ayu_admin_panel/core/core.dart';
import 'package:ayu_admin_panel/services/services.dart';
import 'package:flutter/material.dart';

class PolicyReportTableWidget extends StatelessWidget {
  const PolicyReportTableWidget({super.key, required this.data, this.onExport});

  final List<ReportEntity> data;
  final Function()? onExport;

  @override
  Widget build(BuildContext context) {
    final columns = [
      TableColumn<ReportEntity>(
        title: 'номер полиса',
        dataExtractor: (item) => item.policyNumber ?? '',
        width: TableConfig.policyNumberWidth,
      ),
      TableColumn<ReportEntity>(
        title: 'дата оформления',
        dataExtractor: (item) => item.creationDate?.formatted ?? '',
        width: TableConfig.dateWidth,
      ),
      TableColumn<ReportEntity>(
        title: 'период действия',
        dataExtractor: (item) =>
            '${item.startDate?.formatted} - ${item.endDate?.formatted}',
        width: TableConfig.periodWidth,
      ),
      TableColumn<ReportEntity>(
        title: 'сумма',
        dataExtractor: (item) => '${item.policyCost?.toString()} c',
        width: TableConfig.costWidth70,
      ),
      TableColumn<ReportEntity>(
        title: 'тип полиса',
        dataExtractor: (item) => getTranslatePolicyType(item.policyType ?? ''),
        width: TableConfig.policyTypeWidth,
      ),
      TableColumn<ReportEntity>(
        title: 'автомобиль',
        dataExtractor: (item) => '${item.carBrand} ${item.carModel}',
        width: TableConfig.carWidth,
      ),
      TableColumn<ReportEntity>(
        title: 'владелец',
        dataExtractor: (item) => item.policyHolderName ?? '',
        width: TableConfig.nameWidth,
      ),
    ];

    return CustomTable<ReportEntity>(
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
