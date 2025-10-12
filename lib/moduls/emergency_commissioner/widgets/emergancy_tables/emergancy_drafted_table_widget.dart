import 'package:ayu_admin_panel/components/components.dart';
import 'package:ayu_admin_panel/config/config.dart';
import 'package:ayu_admin_panel/core/core.dart';
import 'package:ayu_admin_panel/services/services.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class EmergencyDraftedTableWidget extends StatelessWidget {
  const EmergencyDraftedTableWidget({
    super.key,
    required this.data,
    this.onTap,
  });

  final List<AvarSearchEntity> data;
  final Function(int index)? onTap;

  @override
  Widget build(BuildContext context) {
    final columns = [
      TableColumn<AvarSearchEntity>(
        title: '',
        dataExtractor: (item) => '',
        width: TableConfig.idWidth,
        customBuilder: (item) => Dot(color: AppColors.primary50),
      ),
      TableColumn<AvarSearchEntity>(
        title: 'номер РЗНУ',
        dataExtractor: (item) => item.registrationId ?? '',
        width: TableConfig.idWidth,
      ),
      TableColumn<AvarSearchEntity>(
        title: 'предварительная сумма',
        dataExtractor: (item) => item.accidentCost?.toString() ?? '',
        width: TableConfig.costWidth100,
      ),
      TableColumn<AvarSearchEntity>(
        title: 'номер полиса',
        dataExtractor: (item) => item.policyNumber ?? '',
        width: TableConfig.policyNumberWidth,
      ),
      TableColumn<AvarSearchEntity>(
        title: 'период действия',
        dataExtractor: (item) =>
            '${item.policyStartDate?.formatted} - ${item.policyEndDate?.formatted}',
        width: TableConfig.periodWidth,
      ),
      TableColumn<AvarSearchEntity>(
        title: 'владелец',
        width: TableConfig.nameWidth,
        dataExtractor: (item) => item.holderName ?? '',
      ),
      TableColumn<AvarSearchEntity>(
        title: 'пин владельца',
        dataExtractor: (item) => item.holderPin?.toString() ?? '',
        width: TableConfig.pinWidth,
      ),
      TableColumn<AvarSearchEntity>(
        title: 'гос.номер',
        dataExtractor: (item) => item.carNumber ?? '',
        width: TableConfig.carNumberWidth,
      ),
      TableColumn<AvarSearchEntity>(
        title: 'автомобиль',
        dataExtractor: (item) => '${item.carBrand} ${item.carModel}',
        width: TableConfig.carWidth,
      ),
      TableColumn<AvarSearchEntity>(
        title: 'статус',
        dataExtractor: (item) => item.policyStatus?.name ?? '',
        width: TableConfig.statusWidth,
        customBuilder: (item) => TextTag(
          text: item.policyStatus?.name ?? '',
          textColor: item.isActive ? AppColors.green : AppColors.red,
          color: item.isActive
              ? AppColors.green.withAlpha(40)
              : AppColors.red.withAlpha(30),
        ),
      ),
    ];
    return CustomTable(
      data: data,
      columns: columns,
      enableHorizontalScroll: true,
      minWidth: 1400,
      onTap: onTap,
    );
  }
}
