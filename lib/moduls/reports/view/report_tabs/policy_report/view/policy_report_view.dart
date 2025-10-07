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
  final PolicyReportParam _defaultParams = PolicyReportParam(isActive: null);

  @override
  void initState() {
    super.initState();
    context.read<PolicyReportCubit>().getPolicyReport(param: _defaultParams);
  }

  String? _selectedPolicyType;
  DateTime? _startDate;
  DateTime? _endDate;
  bool? _isActive;

  static const List<DropdownItem<bool?>> _statusItems = [
    DropdownItem(value: null, label: 'Все'),
    DropdownItem(value: true, label: 'Активные'),
    DropdownItem(value: false, label: 'Неактивные'),
  ];

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

  void _onStatusChanged(bool? value) {
    setState(() {
      _isActive = value;
    });
  }

  void _resetFilters() {
    setState(() {
      _selectedPolicyType = null;
      _startDate = null;
      _endDate = null;
      _isActive = null;
    });
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
              _isActive,
            ),
            onFiltersReset: _resetFilters,
            filtersList: _buildFilterWidgets(),
          ),
          BlocBuilder<PolicyReportCubit, PolicyReportState>(
            builder: (context, state) {
              return switch (state) {
                PolicyReportInitial() => const CenteredIndicator(),
                PolicyReportLoading() => const CenteredIndicator(),
                PolicyReportSuccess() => PolicyReportTable(data: state.entity),
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
}

void _onApplyFilter(
  BuildContext context,
  DateTime? startDate,
  DateTime? endDate,
  String? policyType,
  bool? isActive,
) {
  final PolicyReportParam filters = PolicyReportParam(
    startDate: startDate,
    endDate: endDate,
    policyType: policyType,
    isActive: isActive,
  );
  final bloc = context.read<PolicyReportCubit>();

  final param = PolicyReportParam(
    startDate: filters.startDate,
    endDate: filters.endDate,
    policyType: filters.policyType,
    isActive: filters.isActive,
  );

  bloc.getPolicyReport(param: param);
}