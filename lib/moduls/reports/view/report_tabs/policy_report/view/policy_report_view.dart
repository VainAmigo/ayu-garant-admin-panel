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

  @override
  void initState() {
    super.initState();
    // Загружаем данные с дефолтными параметрами при инициализации
      context.read<PolicyReportCubit>().getPolicyReport(param: _defaultParams);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PolicyReportCubit, PolicyReportState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Заголовок страницы
              _buildPageHeader(),
              const SizedBox(height: 24),
              
              // Блок фильтров
              PolicyReportFilters(
                initialFilters: _defaultParams,
                onFiltersChanged: (filters) {
                  // Применяем фильтры и делаем новый запрос
                  context.read<PolicyReportCubit>().getPolicyReport(param: filters);
                },
              ),
              const SizedBox(height: 24),
              
              // Контент в зависимости от состояния
              _buildContent(state),
            ],
          ),
        );
      },
    );
  }

  Widget _buildPageHeader() {
    return Row(
      children: [
        Icon(
          Icons.assessment_outlined,
          color: AppColors.primary,
          size: 24,
        ),
        const SizedBox(width: 12),
        Text(
          'Отчет по полисам',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            color: AppColors.black,
          ),
        ),
      ],
    );
  }

  Widget _buildContent(PolicyReportState state) {
    if (state is PolicyReportLoading) {
      return const SizedBox(
        height: 200,
        child: Center(
          child: CenteredIndicator(),
        ),
      );
    }
    
    if (state is PolicyReportSuccess) {
      return PolicyReportTable(
        data: state.entity,
        onSort: (column) {
          // TODO: Реализовать сортировку
          // Пока что просто показываем данные
        },
      );
    }
    
    if (state is PolicyReportError) {
      return _buildErrorState();
    }
    
    // Начальное состояние
    return const SizedBox.shrink();
  }

  Widget _buildErrorState() {
    return SizedBox(
      height: 300,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: AppColors.red,
            ),
            const SizedBox(height: 16),
            Text(
              'Произошла ошибка при загрузке данных',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Попробуйте обновить страницу или обратитесь к администратору',
              style: TextStyle(
                fontSize: 12,
                color: AppColors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                // Повторная попытка загрузки
                context.read<PolicyReportCubit>().getPolicyReport(param: _defaultParams);
              },
              icon: Icon(Icons.refresh, color: AppColors.white),
              label: Text(
                'Повторить попытку',
                style: TextStyle(color: AppColors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
