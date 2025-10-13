import 'dart:async';

import 'package:ayu_admin_panel/components/components.dart';
import 'package:ayu_admin_panel/config/config.dart';
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
        listener: (context, state) {},
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
    required this.onApplyFilter,
  });

  final AnalyticPrepareState prepareState;
  final Function() onApplyFilter;

  @override
  State<AnalyticFilterWidget> createState() => _AnalyticFilterWidgetState();
}

class _AnalyticFilterWidgetState extends State<AnalyticFilterWidget> {
  String? _selectedStatus;
  DotPeriod _selectedPeriod = DotPeriod.day;
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
      _selectedPeriod = DotPeriod.values.firstWhere(
        (period) => period.name == widget.prepareState.dateRange!,
      );
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
      spacing: AppSpacing.defaultPadding,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        Row(
          spacing: AppSpacing.defaultPadding,
          children: [
            Text(
              'Фильтр',
              style: AppTypography.black20w400,
              textAlign: TextAlign.start,
            ),
            const Spacer(),
            PrimaryButton(
              text: 'Сформировать',
              onPressed: widget.onApplyFilter,
            ),
          ],
        ),
        Responsive.isDesktop(context)
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                spacing: AppSpacing.defaultPadding,
                children: [
                  DotPeriodPicker(onPeriodSelected: _onPeriodSelected),
                  CustomDropDown<String>(
                    value: _selectedStatus,
                    onChanged: (value) {
                      setState(() {
                        _selectedStatus = value;
                      });
                      _debouncedUpdateFilterData();
                    },
                  ),
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
                ],
              )
            : Column(
                spacing: AppSpacing.defaultPadding,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  DotPeriodPicker(onPeriodSelected: _onPeriodSelected),
                  CustomDropDown<String>(
                    value: _selectedStatus,
                    onChanged: (value) {
                      setState(() {
                        _selectedStatus = value;
                      });
                      _debouncedUpdateFilterData();
                    },
                  ),
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
                ],
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
    context.read<AnalyticBloc>().add(
      SetFilterData(
        startDate: _startDate,
        endDate: _endDate,
        dateRange: _selectedPeriod.name,
        policyType: _selectedStatus,
      ),
    );
  }

  void _resetDatePicker() {
    setState(() {
      _startDate = null;
      _endDate = null;
    });
    _debouncedUpdateFilterData();
  }

  void _onPeriodSelected(DotPeriod period) {
    setState(() {
      _selectedPeriod = period;
    });
    _debouncedUpdateFilterData();
  }
}
