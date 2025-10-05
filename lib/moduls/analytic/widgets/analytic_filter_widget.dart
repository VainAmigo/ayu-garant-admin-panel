import 'package:ayu_admin_panel/components/components.dart';
import 'package:ayu_admin_panel/moduls/analytic/analytic.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnalyticFilter extends StatelessWidget {
  const AnalyticFilter({super.key, required this.onApplyFilter});

  final Function() onApplyFilter;

  @override
  Widget build(BuildContext context) {
    String? selectedStatus;
    return Container(
      padding: const EdgeInsets.all(AppSpacing.defaultPadding),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: AnalyticFilterWidget(selectedStatus: selectedStatus, onApplyFilter: onApplyFilter),
    );
  }
}

class AnalyticFilterWidget extends StatefulWidget {
  const AnalyticFilterWidget({super.key, this.selectedStatus, required this.onApplyFilter});

  final String? selectedStatus;
  final Function() onApplyFilter;

  @override
  State<AnalyticFilterWidget> createState() => _AnalyticFilterWidgetState();
}

class _AnalyticFilterWidgetState extends State<AnalyticFilterWidget> {
  String? _selectedStatus;
  PeriodFilter _selectedPeriod = PeriodFilter.day;
  DateTime? _startDate;
  DateTime? _endDate;

  @override
  void initState() {
    super.initState();
    _selectedStatus = widget.selectedStatus;
  }


  String _getDateRangeString(PeriodFilter period) {
    switch (period) {
      case PeriodFilter.day:
        return 'day';
      case PeriodFilter.week:
        return 'week';
      case PeriodFilter.month:
        return 'month';
      case PeriodFilter.year:
        return 'year';
      case PeriodFilter.all:
        return 'all';
    }
  }

  void _updateFilterData() {
    context.read<AnalyticBloc>().add(SetFilterData(
      startDate: _startDate,
      endDate: _endDate,
      dateRange: _getDateRangeString(_selectedPeriod),
      policyType: _selectedStatus,
    ));
  }

  void _resetDatePicker() {
    setState(() {
      _startDate = null;
      _endDate = null;
    });
    _updateFilterData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Фильтр',
          style: AppTypography.black20w400,
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: AppSpacing.defaultPadding),
        DotTagFilter(
          initialPeriod: _selectedPeriod,
          onPeriodChanged: (PeriodFilter period) {
            setState(() {
              _selectedPeriod = period;
            });
            _updateFilterData();
          },
        ),
        const SizedBox(height: AppSpacing.defaultPadding),
        CustomDropDown<String>(
          value: _selectedStatus,
          onChanged: (value) {
            setState(() {
              _selectedStatus = value;
            });
            _updateFilterData();
          },
        ),
        const SizedBox(height: AppSpacing.defaultPadding),
        DateRangePickerChip(
          initialStart: _startDate,
          initialEnd: _endDate,
          onChanged: (DateTimeRange? range) {
            setState(() {
              _startDate = range?.start;
              _endDate = range?.end;
            });
            _updateFilterData();
          },
          onReset: () {
            _resetDatePicker();
          },
        ),
        const SizedBox(height: AppSpacing.defaultPadding),
        PrimaryButton(
          text: 'Сформировать', 
          onPressed: widget.onApplyFilter,
        ),
      ],
    );
  }
}
