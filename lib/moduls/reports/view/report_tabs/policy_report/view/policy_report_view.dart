import 'package:ayu_admin_panel/components/components.dart';
import 'package:ayu_admin_panel/moduls/moduls.dart';
import 'package:ayu_admin_panel/services/services.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PolicyReportView extends StatefulWidget {
  const PolicyReportView({super.key});

  @override
  State<PolicyReportView> createState() => _PolicyReportViewState();
}

class _PolicyReportViewState extends State<PolicyReportView> {
  final PolicyReportParam _defaultParams = PolicyReportParam(dateRange: PeriodFilter.day.name);

  @override
  void initState() {
    super.initState();
    context.read<PolicyReportCubit>().getPolicyReport(param: _defaultParams);
  }

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
            onFiltersSet: () => _onApplyFilter(
              context,
              _startDate,
              _endDate,
              _selectedPolicyType,
              _selectedPeriod,
            ),
            onFiltersReset: _resetFilters,
            filtersList: _buildFilterWidgets(),
          ),
          BlocBuilder<PolicyReportCubit, PolicyReportState>(
            builder: (context, state) {
              return switch (state) {
                PolicyReportInitial() => const CenteredIndicator(),
                PolicyReportLoading() => const CenteredIndicator(),
                PolicyReportSuccess() => PolicyReportTableWidget(
                  data: state.entity,
                  onExport: _onExport,
                ),
                PolicyReportError() => Center(
                  child: Text('Ошибка загрузки данных: ${state.error}'),
                ),
              };
            },
          ),
        ],
      ),
    );
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

  void _resetFilters() {
    setState(() {
      _selectedPolicyType = null;
      _startDate = null;
      _endDate = null;
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

  void _onExport() {}

  void _onApplyFilter(
    BuildContext context,
    DateTime? startDate,
    DateTime? endDate,
    String? policyType,
    PeriodFilter? period,
  ) {
    final PolicyReportParam filters = PolicyReportParam(
      startDate: startDate,
      endDate: endDate,
      policyType: policyType,
      dateRange: period?.name,
    );
    final bloc = context.read<PolicyReportCubit>();

    final param = PolicyReportParam(
      startDate: filters.startDate,
      endDate: filters.endDate,
      policyType: filters.policyType,
      dateRange: filters.dateRange,
    );

    print('param: $startDate');
    print('param: $endDate');
    print('param: $policyType');
    print('param: $period');

    bloc.getPolicyReport(param: param);
  }
}
