import 'package:ayu_admin_panel/components/components.dart';
import 'package:ayu_admin_panel/moduls/moduls.dart';
import 'package:ayu_admin_panel/services/services.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

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
                PolicyReportSuccess() => _buildPolicyTable(state.entity),
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

  Widget _buildPolicyTable(List<PolicyReportEntity> data) {
    final columns = [
      TableColumn<PolicyReportEntity>(
        title: 'Номер полиса',
        dataExtractor: (item) => item.policyNumber,
        width: 150,
      ),
      TableColumn<PolicyReportEntity>(
        title: 'Дата оформления',
        dataExtractor: (item) => _formatDate(item.creationDate),
        width: 120,
      ),
      TableColumn<PolicyReportEntity>(
        title: 'Период действия',
        dataExtractor: (item) => '${_formatDate(item.startDate)} - ${_formatDate(item.endDate)}',
        width: 200,
      ),
      TableColumn<PolicyReportEntity>(
        title: 'Сумма',
        dataExtractor: (item) => '${item.policyCost.toStringAsFixed(2)} c',
        width: 120,
        alignment: TextAlign.right,
      ),
      TableColumn<PolicyReportEntity>(
        title: 'Тип полиса',
        dataExtractor: (item) => _translatePolicyType(item.policyType),
        width: 120,
      ),
      TableColumn<PolicyReportEntity>(
        title: 'Автомобиль',
        dataExtractor: (item) => '${item.brand} ${item.model}',
        width: 200,
      ),
      TableColumn<PolicyReportEntity>(
        title: 'Владелец',
        dataExtractor: (item) => item.policyHolderName,
        width: 200,
      ),
      TableColumn<PolicyReportEntity>(
        title: 'Статус',
        dataExtractor: (item) => _translateStatus(item.policyStatus),
        width: 120,
        customBuilder: (item) => StatusChip(
          status: _translateStatus(item.policyStatus),
        ),
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Найденные полисы: ${data.length}',
              style: AppTypography.black32w600,
            ),
            ElevatedButton.icon(
              onPressed: () {
                // TODO: Реализовать экспорт в Excel
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Экспорт в Excel будет реализован')),
                );
              },
              icon: const Icon(Icons.download),
              label: const Text('Экспортировать в Excel'),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.white,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        CustomTable<PolicyReportEntity>(
          columns: columns,
          data: data,
          enableHorizontalScroll: true,
          minWidth: 1200,
        ),
        const SizedBox(height: 16),
        _buildPagination(data.length),
      ],
    );
  }

  Widget _buildPagination(int totalItems) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.chevron_left),
        ),
        ...List.generate(5, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: index == 0 ? AppColors.primary : null,
                foregroundColor: index == 0 ? AppColors.white : AppColors.black,
                minimumSize: const Size(40, 40),
              ),
              child: Text('${index + 1}'),
            ),
          );
        }),
        const Text('...'),
        TextButton(
          onPressed: () {},
          child: const Text('31'),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.chevron_right),
        ),
      ],
    );
  }

  String _formatDate(DateTime date) {
    return DateFormat('dd.MM.yyyy').format(date);
  }

  String _translatePolicyType(String type) {
    switch (type.toUpperCase()) {
      case 'OSAGO':
        return 'ОСАГО';
      case 'KASKO':
        return 'КАСКО';
      case 'KASKO_MINI':
        return 'КАСКО-мини';
      case 'DSAGO':
        return 'ДСАГО';
      default:
        return type;
    }
  }

  String _translateStatus(PolicyStatus status) {
    switch (status) {
      case PolicyStatus.active:
        return 'активный';
      case PolicyStatus.unPaid:
        return 'неоплачен';
      case PolicyStatus.expired:
        return 'истек';
    }
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

  print('param: $startDate');
  print('param: $endDate');
  print('param: $policyType');
  print('param: $isActive');

  bloc.getPolicyReport(param: param);
}
