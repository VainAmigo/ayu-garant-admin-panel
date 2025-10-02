import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';
import 'table_column_config.dart';
import 'table_row_widget.dart';

/// Виджет списка строк таблицы
class TableListWidget extends StatelessWidget {
  final List<Map<String, dynamic>> data;
  final TableConfig config;
  final Function(Map<String, dynamic>)? onRowTap;

  const TableListWidget({
    super.key,
    required this.data,
    required this.config,
    this.onRowTap,
  });

  @override
  Widget build(BuildContext context) {
    if (data.isEmpty) {
      return _buildEmptyState();
    }

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          _buildHeader(),
          ..._buildRows(),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return TableRowWidget(
      data: _getHeaderData(),
      config: config,
      isHeader: true,
    );
  }

  List<Widget> _buildRows() {
    return data.asMap().entries.map((entry) {
      final index = entry.key;
      final rowData = entry.value;
      final isAlternating = index % 2 == 1;

      return TableRowWidget(
        data: rowData,
        config: config,
        isAlternating: isAlternating,
        onTap: onRowTap != null ? () => onRowTap!(rowData) : null,
      );
    }).toList();
  }

  Map<String, dynamic> _getHeaderData() {
    final headerData = <String, dynamic>{};
    for (final column in config.columns) {
      headerData[column.key] = column.title;
    }
    return headerData;
  }

  Widget _buildEmptyState() {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.inbox_outlined,
              size: 48,
              color: AppColors.grey,
            ),
            SizedBox(height: 16),
            Text(
              'Нет данных для отображения',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}