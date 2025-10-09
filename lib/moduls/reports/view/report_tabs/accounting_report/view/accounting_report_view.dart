import 'dart:developer';

import 'package:ayu_admin_panel/components/components.dart';
import 'package:ayu_admin_panel/moduls/moduls.dart';
import 'package:ayu_admin_panel/services/services.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  String? _selectedPaymentSystem;

  final ReportParam _defaultParams = ReportParam(dateRange: PeriodFilter.day.name);

  @override
  void initState() {
    super.initState();
    context.read<AccountingCubit>().getAccountingReport(param: _defaultParams);
  }

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
          BlocBuilder<AccountingCubit, AccountingState>(
            builder: (context, state) {
              return switch (state) {
                AccountingInitial() => const CenteredIndicator(),
                AccountingLoading() => const CenteredIndicator(),
                AccountingSuccess() => AccountingReportTableWidget(
                  data: state.entity,
                ),
                AccountingError() => Center(
                  child: Text('Ошибка загрузки данных: ${state.error}'),
                ),
              };
            },
          ),
        ],
      ),
    );
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

  void _onPaymentSystemChanged(String? value) {
    setState(() {
      _selectedPaymentSystem = value == 'all' ? null : value;
    });
  }

  void _onDateRangeChanged(DateTimeRange? range) {
    setState(() {
      _startDate = range?.start;
      _endDate = range?.end;
    });
  }

  final List<DropdownItem<String>> _paymentSystemItems = [
    DropdownItem(value: 'all', label: 'Все'),
    DropdownItem(value: 'Finik', label: 'Финик'),
    DropdownItem(value: 'FreedomPay', label: 'FreedomPay'),
  ];

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
      CustomDropDown<String>(
        value: _selectedPaymentSystem,
        items: _paymentSystemItems,
        onChanged: _onPaymentSystemChanged,
      ),
    ];
  }

  void _onApplyFilter(BuildContext context) {
    final bloc = context.read<AccountingCubit>();
    final param = ReportParam(
      startDate: _startDate,
      endDate: _endDate,
      policyType: _selectedPolicyType,
      dateRange: _selectedPeriod.name,
      paymentSystem: _selectedPaymentSystem,
    );
    
    log('param: ${param.toBody().toJson()}');
    log('param: ${_selectedPolicyType}');
    log('param: ${_startDate}');
    log('param: ${_endDate}');
    log('param: ${_selectedPeriod}');
    log('param: ${_selectedPaymentSystem}');

    bloc.getAccountingReport(param: param);
  }
}
