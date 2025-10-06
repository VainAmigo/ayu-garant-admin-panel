import 'dart:async';

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
    return Container(
      padding: const EdgeInsets.all(AppSpacing.defaultPadding),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: BlocListener<AnalyticBloc, AnalyticState>(
        listener: (context, state) {
        },
        child: BlocBuilder<AnalyticBloc, AnalyticState>(
          buildWhen: (previous, current) {
            return previous.prepareState != current.prepareState;
          },
          builder: (context, state) {
            return AnalyticFilterWidget(
              prepareState: state.prepareState,
              onApplyFilter: onApplyFilter,
            );
          },
        ),
      ),
    );
  }
}

class AnalyticFilterWidget extends StatefulWidget {
  const AnalyticFilterWidget({
    super.key, 
    required this.prepareState, 
    required this.onApplyFilter
  });

  final AnalyticPrepareState prepareState;
  final Function() onApplyFilter;

  @override
  State<AnalyticFilterWidget> createState() => _AnalyticFilterWidgetState();
}

class _AnalyticFilterWidgetState extends State<AnalyticFilterWidget> {
  String? _selectedStatus;
  PeriodFilter _selectedPeriod = PeriodFilter.day;
  DateTime? _startDate;
  DateTime? _endDate;
  
  Timer? _debounceTimer;
  static const Duration _debounceDelay = Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _initializeFromPrepareState();
  }

  @override
  void didUpdateWidget(AnalyticFilterWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.prepareState != widget.prepareState) {
      _initializeFromPrepareState();
    }
  }

  void _initializeFromPrepareState() {
    _selectedStatus = widget.prepareState.policyType;
    _startDate = widget.prepareState.startDate;
    _endDate = widget.prepareState.endDate;
    
    if (widget.prepareState.dateRange != null) {
      _selectedPeriod = _getPeriodFromString(widget.prepareState.dateRange!);
    }
  }

  @override
  void dispose() {
    _debounceTimer?.cancel();
    super.dispose();
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
            _debouncedUpdateFilterData();
          },
        ),
        const SizedBox(height: AppSpacing.defaultPadding),
        CustomDropDown<String>(
          value: _selectedStatus,
          onChanged: (value) {
            setState(() {
              _selectedStatus = value;
            });
            _debouncedUpdateFilterData();
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
            _debouncedUpdateFilterData();
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

  void _debouncedUpdateFilterData() {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(_debounceDelay, () {
      _updateFilterData();
    });
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
    _debouncedUpdateFilterData();
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

  PeriodFilter _getPeriodFromString(String dateRange) {
    switch (dateRange) {
      case 'day':
        return PeriodFilter.day;
      case 'week':
        return PeriodFilter.week;
      case 'month':
        return PeriodFilter.month;
      case 'year':
        return PeriodFilter.year;
      case 'all':
        return PeriodFilter.all;
      default:
        return PeriodFilter.day;
    }
  }
}
