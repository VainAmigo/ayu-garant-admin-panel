import 'package:ayu_admin_panel/components/components.dart';
import 'package:ayu_admin_panel/moduls/reports/view/report_tabs/policy_report/cubit/policy_report_cubit.dart';
import 'package:ayu_admin_panel/moduls/reports/view/report_tabs/policy_report/widgets/policy_report_filters.dart';
import 'package:ayu_admin_panel/moduls/reports/view/report_tabs/policy_report/widgets/policy_report_table.dart';
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
  // Дефолтные параметры для начальной загрузки
  static const PolicyReportParam _defaultParams = PolicyReportParam(
    isActive: true, // Показываем только активные полисы по умолчанию
  );

  // Текущие параметры фильтров
  PolicyReportParam _currentFilters = _defaultParams;

  @override
  void initState() {
    super.initState();
    context.read<PolicyReportCubit>().getPolicyReport(param: _defaultParams);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: AppSpacing.defaultPadding,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PolicyReportFilters(
            initialFilters: _currentFilters,
            onFiltersChanged: (filters) {
              setState(() {
                _currentFilters = filters;
              });
              context.read<PolicyReportCubit>().getPolicyReport(param: filters);
            },
          ),
      
          BlocBuilder<PolicyReportCubit, PolicyReportState>(
            builder: (context, state) {
              return switch (state) {
                PolicyReportLoading() => const CenteredIndicator(),
                PolicyReportSuccess() => PolicyReportTable(data: state.entity),
                PolicyReportError() => Center(
                  child: Text('Ошибка загрузки данных: ${state.error}'),
                ),
                _ => const SizedBox.shrink(),
              };
            },
          ),
        ],
      ),
    );
  }
}
