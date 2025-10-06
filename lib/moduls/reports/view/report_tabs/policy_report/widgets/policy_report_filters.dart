import 'package:ayu_admin_panel/components/components.dart';
import 'package:ayu_admin_panel/config/config.dart';
import 'package:ayu_admin_panel/services/entities/policy_report_entity.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

/// Виджет фильтров для отчета по полисам
/// Содержит элементы управления для фильтрации данных:
/// - Выбор типа полиса
/// - Выбор диапазона дат
/// - Фильтр по статусу (активные/неактивные)
/// - Кнопка сброса фильтров
class PolicyReportFilters extends StatefulWidget {
  const PolicyReportFilters({
    super.key,
    required this.onFiltersChanged,
    this.initialFilters,
  });

  final ValueChanged<PolicyReportParam> onFiltersChanged;
  final PolicyReportParam? initialFilters;

  @override
  State<PolicyReportFilters> createState() => _PolicyReportFiltersState();
}

class _PolicyReportFiltersState extends State<PolicyReportFilters> {
  // Состояние фильтров
  String? _selectedPolicyType;
  DateTime? _startDate;
  DateTime? _endDate;
  bool? _isActive;

  // Опции для фильтра статуса
  static const List<DropdownItem<bool?>> _statusItems = [
    DropdownItem(value: null, label: 'Все'),
    DropdownItem(value: true, label: 'Активные'),
    DropdownItem(value: false, label: 'Неактивные'),
  ];

  @override
  void initState() {
    super.initState();
    _initializeFilters();
  }

  void _initializeFilters() {
    if (widget.initialFilters != null) {
      _selectedPolicyType = widget.initialFilters!.policyType;
      _startDate = widget.initialFilters!.startDate;
      _endDate = widget.initialFilters!.endDate;
      _isActive = widget.initialFilters!.isActive;
    }
  }

  void _onPolicyTypeChanged(String? value) {
    setState(() {
      _selectedPolicyType = value == 'all' ? null : value;
    });
    _notifyFiltersChanged();
  }

  void _onDateRangeChanged(DateTimeRange? range) {
    setState(() {
      _startDate = range?.start;
      _endDate = range?.end;
    });
    _notifyFiltersChanged();
  }

  void _onStatusChanged(bool? value) {
    setState(() {
      _isActive = value;
    });
    _notifyFiltersChanged();
  }

  void _resetFilters() {
    setState(() {
      _selectedPolicyType = null;
      _startDate = null;
      _endDate = null;
      _isActive = null;
    });
    _notifyFiltersChanged();
  }

  void _notifyFiltersChanged() {
    final filters = PolicyReportParam(
      startDate: _startDate,
      endDate: _endDate,
      policyType: _selectedPolicyType,
      isActive: _isActive,
    );
    widget.onFiltersChanged(filters);
  }

  List<Widget> _buildFilterWidgets() {
    return [
      CustomDropDown<String>(
        value: _selectedPolicyType,
        onChanged: _onPolicyTypeChanged,
      ),
      DateRangePickerChip(
        initialStart: _startDate,
        initialEnd: _endDate,
        onChanged: _onDateRangeChanged,
        hintStart: 'Дата начала',
        hintEnd: 'Дата окончания',
      ),
      CustomDropDown<bool?>(
        items: _statusItems,
        value: _isActive,
        onChanged: _onStatusChanged,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.defaultPadding),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.grey100),
      ),
      child: Column(
        spacing: AppSpacing.defaultPadding,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('Фильтры', style: AppTypography.black20w400),
              const Spacer(),
              // Кнопка сброса фильтров
              TextButton.icon(
                onPressed: _resetFilters,
                icon: Icon(Icons.refresh, size: 16, color: AppColors.grey),
                label: Text(
                  'Сбросить',
                  style: TextStyle(fontSize: 12, color: AppColors.grey),
                ),
              ),
            ],
          ),

          Responsive.isDesktop(context)
              ? Row(
                  spacing: AppSpacing.defaultPadding,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: _buildFilterWidgets(),
                )
              : Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: _buildFilterWidgets(),
                ),
        ],
      ),
    );
  }
}
