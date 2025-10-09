import 'package:ayu_admin_panel/components/components.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class AccountingReportView extends StatefulWidget {
  const AccountingReportView({super.key});

  @override
  State<AccountingReportView> createState() => _AccountingReportViewState();
}

class _AccountingReportViewState extends State<AccountingReportView> {
  String? _selectedPolicyType;
  DateTime? _startDate;
  DateTime? _endDate;
  PeriodFilter _selectedPeriod = PeriodFilter.day;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: AppSpacing.defaultPadding,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Filter(
            onFiltersSet: () => _onApplyFilter(context),
            onFiltersReset: () => _resetFilters(),
            filtersList: _buildFilterWidgets(),
          ),
        ],
      ),
    );
  }

  void _onApplyFilter(BuildContext context) {
    // TODO: Implement _onApplyFilter
  }

  void _resetFilters() {
    setState(() {
      _selectedPolicyType = null;
      _startDate = null;
      _endDate = null;
      _selectedPeriod = PeriodFilter.day;
    });
  }


  void _onPolicyTypeChanged(String? value) {
    setState(() {
      _selectedPolicyType = value == 'all' ? null : value;
    });
  }

  void _onDateRangeChanged(DateTimeRange? range) {
    setState(() {
      _startDate = range?.start;
      _endDate = range?.end;
    });
  }

  List<Widget> _buildFilterWidgets() {
    return [
      DotTagFilter(
        initialPeriod: _selectedPeriod,
        onPeriodChanged: (PeriodFilter period) {
          setState(() {
            _selectedPeriod = period;
          });
        },
      ),
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
    ];
  }
}
