import 'package:ayu_admin_panel/components/components.dart';
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
        width: 100,
      ),
      TableColumn<ReportEntity>(
        title: 'пин пользователя',
        dataExtractor: (item) => item.userPin ?? '',
        width: 100,
      ),
      TableColumn<ReportEntity>(
        title: 'владелец',
        dataExtractor: (item) => item.policyHolderName ?? '',
        width: 100,
      ),
      TableColumn<ReportEntity>(
        title: 'пин владельца',
        dataExtractor: (item) => item.policyHolderPin ?? '',
        width: 100,
      ),
      TableColumn<ReportEntity>(
        title: 'номер полиса',
        dataExtractor: (item) => item.policyNumber ?? '',
        width: 100,
      ),
      TableColumn<ReportEntity>(
        title: 'тип полиса',
        dataExtractor: (item) => item.policyType ?? '',
        width: 100,
      ),
      TableColumn<ReportEntity>(
        title: 'сумма премии',
        dataExtractor: (item) => '${item.premiumWithoutTax?.toStringAsFixed(2)} c',
        width: 100,
      ),
      TableColumn<ReportEntity>(
        title: 'премия без налога',
        dataExtractor: (item) => '${item.premiumWithoutTax?.toStringAsFixed(2)} c',
        width: 100,
      ),
      TableColumn<ReportEntity>(
        title: 'использованные бонусы',
        dataExtractor: (item) => '${item.usedBonuses?.toStringAsFixed(2)} c',
        width: 100,
      ),
      TableColumn<ReportEntity>(
        title: 'начисленные бонусы',
        dataExtractor: (item) => '${item.accruedBonuses?.toStringAsFixed(2)} c',
        width: 100,
      ),
      TableColumn<ReportEntity>(
        title: 'использованные кэшбэк',
        dataExtractor: (item) => '${item.usedCashBack?.toStringAsFixed(2)} c',
        width: 100,
      ),
      TableColumn<ReportEntity>(
        title: 'начисленные кэшбэк',
        dataExtractor: (item) => '${item.accruedCashBack?.toStringAsFixed(2)} c',
        width: 100,
      ),
      TableColumn<ReportEntity>(
        title: 'система оплаты',
        dataExtractor: (item) => item.paymentSystem ?? '',
        width: 100,
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
}