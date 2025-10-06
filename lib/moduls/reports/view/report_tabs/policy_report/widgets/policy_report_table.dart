import 'package:ayu_admin_panel/services/entities/policy_report_entity.dart';
import 'package:ayu_admin_panel/services/models/policy_report_response.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Виджет таблицы для отображения отчета по полисам
/// Показывает данные в виде таблицы с возможностью сортировки
class PolicyReportTable extends StatelessWidget {
  const PolicyReportTable({
    super.key,
    required this.data,
    this.onSort,
    this.sortColumn,
    this.sortAscending = true,
  });

  final List<PolicyReportEntity> data;
  final Function(String)? onSort;
  final String? sortColumn;
  final bool sortAscending;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grey100),
      ),
      child: Column(
        children: [
          // Заголовок таблицы
          _buildTableHeader(),
          
          // Тело таблицы
          if (data.isEmpty)
            _buildEmptyState()
          else
            _buildTableBody(),
        ],
      ),
    );
  }

  Widget _buildTableHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.grey100,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Row(
        children: [
          _buildHeaderCell('Номер полиса', 'policyNumber', flex: 2),
          _buildHeaderCell('Дата создания', 'creationDate', flex: 1),
          _buildHeaderCell('Период действия', 'period', flex: 2),
          _buildHeaderCell('Тип', 'policyType', flex: 1),
          _buildHeaderCell('Стоимость', 'policyCost', flex: 1),
          _buildHeaderCell('Автомобиль', 'vehicle', flex: 2),
          _buildHeaderCell('Владелец', 'policyHolderName', flex: 2),
          _buildHeaderCell('Статус', 'policyStatus', flex: 1),
        ],
      ),
    );
  }

  Widget _buildHeaderCell(String title, String columnKey, {int flex = 1}) {
    final isSorted = sortColumn == columnKey;
    
    return Expanded(
      flex: flex,
      child: GestureDetector(
        onTap: () => onSort?.call(columnKey),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.black,
              ),
            ),
            if (isSorted) ...[
              const SizedBox(width: 4),
              Icon(
                sortAscending ? Icons.arrow_upward : Icons.arrow_downward,
                size: 16,
                color: AppColors.primary,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildTableBody() {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data.length,
      separatorBuilder: (context, index) => Divider(
        height: 1,
        color: AppColors.grey100,
      ),
      itemBuilder: (context, index) {
        final item = data[index];
        return _buildTableRow(item);
      },
    );
  }

  Widget _buildTableRow(PolicyReportEntity item) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          _buildDataCell(item.policyNumber, flex: 2),
          _buildDataCell(_formatDate(item.creationDate), flex: 1),
          _buildDataCell('${_formatDate(item.startDate)} - ${_formatDate(item.endDate)}', flex: 2),
          _buildDataCell(item.policyType, flex: 1),
          _buildDataCell('${item.policyCost.toStringAsFixed(0)} c', flex: 1),
          _buildDataCell('${item.brand} ${item.model}', flex: 2),
          _buildDataCell(item.policyHolderName, flex: 2),
          _buildStatusCell(item.policyStatus, flex: 1),
        ],
      ),
    );
  }

  Widget _buildDataCell(String text, {int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.black,
        ),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _buildStatusCell(PolicyStatus status, {int flex = 1}) {
    Color backgroundColor;
    Color textColor;
    String statusText;

    switch (status) {
      case PolicyStatus.active:
        backgroundColor = AppColors.green.withOpacity(0.1);
        textColor = AppColors.green;
        statusText = 'Активный';
        break;
      case PolicyStatus.unPaid:
        backgroundColor = AppColors.oragne.withOpacity(0.1);
        textColor = AppColors.oragne;
        statusText = 'Неоплачен';
        break;
      case PolicyStatus.expired:
        backgroundColor = AppColors.red.withOpacity(0.1);
        textColor = AppColors.red;
        statusText = 'Истек';
        break;
    }

    return Expanded(
      flex: flex,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          statusText,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w500,
            color: textColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          Icon(
            Icons.inbox_outlined,
            size: 48,
            color: AppColors.grey,
          ),
          const SizedBox(height: 16),
          Text(
            'Нет данных для отображения',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColors.grey,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Попробуйте изменить параметры фильтрации',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    return DateFormat('dd.MM.yyyy').format(date);
  }
}
