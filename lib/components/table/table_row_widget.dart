import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';
import 'table_column_config.dart';

/// Виджет строки таблицы
class TableRowWidget extends StatelessWidget {
  final Map<String, dynamic> data;
  final TableConfig config;
  final bool isHeader;
  final bool isAlternating;
  final VoidCallback? onTap;

  const TableRowWidget({
    super.key,
    required this.data,
    required this.config,
    this.isHeader = false,
    this.isAlternating = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final backgroundColor = _getBackgroundColor();
    
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: backgroundColor,
          border: Border(
            bottom: BorderSide(
              color: AppColors.grey100,
              width: 1,
            ),
          ),
        ),
        child: Row(
          children: config.columns.map((column) {
            return _buildCell(column);
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildCell(TableColumnConfig column) {
    final width = column.width;
    final content = _getCellContent(column);

    Widget cell = Container(
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Align(
        alignment: Alignment.centerLeft,
        child: content,
      ),
    );

    if (width != null) {
      return SizedBox(
        width: width,
        child: cell,
      );
    } else {
      return Expanded(child: cell);
    }
  }

  Widget _getCellContent(TableColumnConfig column) {
    if (isHeader) {
      return Text(
        column.title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
          color: AppColors.black,
        ),
      );
    }

    if (column.customBuilder != null) {
      return column.customBuilder!(data[column.key]);
    }

    final value = data[column.key];
    if (value == null) {
      return const Text(
        '-',
        style: TextStyle(
          color: AppColors.grey,
          fontSize: 14,
        ),
      );
    }

    return Text(
      value.toString(),
      style: const TextStyle(
        fontSize: 14,
        color: AppColors.black,
      ),
    );
  }

  Color _getBackgroundColor() {
    if (isHeader) {
      return AppColors.grey100;
    }
    
    if (isAlternating) {
      return AppColors.grey100;
    }
    
    return AppColors.white;
  }
}