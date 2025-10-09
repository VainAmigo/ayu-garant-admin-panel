import 'package:ayu_admin_panel/components/components.dart';
import 'package:ayu_admin_panel/config/config.dart';
import 'package:ayu_admin_panel/services/services.dart';
import 'package:flutter/material.dart';

class AccountingReportTableWidget extends StatelessWidget {
  const AccountingReportTableWidget({super.key, required this.data, this.onExport});

  final List<ReportEntity> data;
  final Function()? onExport;

  @override
  Widget build(BuildContext context) {
    final columns = [
      TableColumn<ReportEntity>(
        title: 'пользоватеь',
        dataExtractor: (item) => item.userName ?? '',
        width: TableConfig.nameWidth,
      ),
      TableColumn<ReportEntity>(
        title: 'пин пользователя',
        dataExtractor: (item) => item.userPin ?? '',
        width: TableConfig.pinWidth,
      ),
      TableColumn<ReportEntity>(
        title: 'владелец',
        dataExtractor: (item) => item.policyHolderName ?? '',
        width: TableConfig.nameWidth,
      ),
      TableColumn<ReportEntity>(
        title: 'пин владельца',
        dataExtractor: (item) => item.policyHolderPin ?? '',
        width: TableConfig.pinWidth,
      ),
      TableColumn<ReportEntity>(
        title: 'номер полиса',
        dataExtractor: (item) => item.policyNumber ?? '',
        width: TableConfig.policyNumberWidth,
      ),
      TableColumn<ReportEntity>(
        title: 'тип полиса',
        dataExtractor: (item) => item.policyType ?? '',
        width: TableConfig.policyTypeWidth,
      ),
      TableColumn<ReportEntity>(
        title: 'сумма премии',
        dataExtractor: (item) => '${item.premiumWithoutTax?.toStringAsFixed(2)} c',
        width: TableConfig.costWidth70,
      ),
      TableColumn<ReportEntity>(
        title: 'премия без налога',
        dataExtractor: (item) => '${item.premiumWithoutTax?.toStringAsFixed(2)} c',
        width: TableConfig.costWidth70,
      ),
      TableColumn<ReportEntity>(
        title: 'использованные бонусы',
        dataExtractor: (item) => '${item.usedBonuses?.toStringAsFixed(2)} c',
        width: TableConfig.costWidth100,
      ),
      TableColumn<ReportEntity>(
        title: 'начисленные бонусы',
        dataExtractor: (item) => '${item.accruedBonuses?.toStringAsFixed(2)} c',
        width: TableConfig.costWidth70,
      ),
      TableColumn<ReportEntity>(
        title: 'использованные кэшбэк',
        dataExtractor: (item) => '${item.usedCashBack?.toStringAsFixed(2)} c',
        width: TableConfig.costWidth100,
      ),
      TableColumn<ReportEntity>(
        title: 'начисленные кэшбэк',
        dataExtractor: (item) => '${item.accruedCashBack?.toStringAsFixed(2)} c',
        width: TableConfig.costWidth70,
      ),
      TableColumn<ReportEntity>(
        title: 'система оплаты',
        dataExtractor: (item) => item.paymentSystem ?? '',
        width: TableConfig.costWidth100,
      ),
    ];

    return CustomTable<ReportEntity>(
      columns: columns,
      data: data,
      enableHorizontalScroll: true,
      minWidth: 1650,
      onExport: onExport,
    );
  }
}