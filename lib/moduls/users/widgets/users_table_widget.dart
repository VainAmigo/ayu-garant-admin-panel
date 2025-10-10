import 'package:ayu_admin_panel/components/components.dart';
import 'package:ayu_admin_panel/config/config.dart';
import 'package:ayu_admin_panel/moduls/moduls.dart';
import 'package:ayu_admin_panel/services/services.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class UsersTableWidget extends StatelessWidget {
  const UsersTableWidget({
    super.key,
    required this.data,
    this.onExport,
    this.onEdit,
    this.onDelete,
    this.onManageRoles,
  });

  final List<UsersReportEntity> data;
  final Function()? onExport;
  final Function()? onEdit;
  final Function()? onDelete;
  final Function()? onManageRoles;

  @override
  Widget build(BuildContext context) {
    final columns = [
      TableColumn<UsersReportEntity>(
        title: 'ID',
        dataExtractor: (item) => item.id,
        width: TableConfig.idWidth,
      ),
      TableColumn<UsersReportEntity>(
        title: 'телефон',
        dataExtractor: (item) => item.phoneNumber,
        width: TableConfig.nameWidth,
      ),
      TableColumn<UsersReportEntity>(
        title: 'имя',
        dataExtractor: (item) => item.name,
        width: TableConfig.nameWidth,
      ),
      TableColumn<UsersReportEntity>(
        title: 'роли',
        dataExtractor: (item) => item.roles.map((e) => e.name).join(', '),
        width: TableConfig.roleWidth,
        customBuilder: (item) => Wrap(
          spacing: 4.0,
          runSpacing: 4.0,
          children: item.roles.map((role) => TextTag(text: role.name)).toList(),
        ),
      ),
      TableColumn<UsersReportEntity>(
        title: 'статус',
        dataExtractor: (item) => item.status.name,
        width: TableConfig.statusWidth,
        customBuilder: (item) => TextTag(
          text: item.status.name,
          textColor: item.isActive ? AppColors.green : AppColors.red,
          color: item.isActive
              ? AppColors.green.withAlpha(40)
              : AppColors.red.withAlpha(30),
        ),
      ),
      TableColumn<UsersReportEntity>(
        title: 'действия',
        dataExtractor: (item) => '',
        width: TableConfig.actionsWidth,
        customBuilder: (item) => UsersActionsWidget(
          onEdit: onEdit,
          onDelete: onDelete,
          onManageRoles: onManageRoles,
        ),
      ),
    ];

    return CustomTable<UsersReportEntity>(
      columns: columns,
      data: data,
      enableHorizontalScroll: true,
      minWidth: 1350,
      onExport: onExport,
    );
  }
}
