import 'dart:developer';

import 'package:ayu_admin_panel/components/components.dart';
import 'package:ayu_admin_panel/moduls/moduls.dart';
import 'package:ayu_admin_panel/services/services.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AnalyticView extends StatefulWidget {
  const AnalyticView({super.key});

  @override
  State<AnalyticView> createState() => _AnalyticViewState();
}

class _AnalyticViewState extends State<AnalyticView> {
  @override
  void initState() {
    super.initState();
    context.read<AnalyticBloc>().add(const InitAnalyticEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.defaultPadding),
          child: Column(
            spacing: AppSpacing.defaultPadding,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Header(title: "Аналитика"),
              AnalyticFilter(onApplyFilter: () => _onApplyFilter(context)),
              BlocBuilder<AnalyticBloc, AnalyticState>(
                builder: (context, state) {
                  final analyticData = state.getAnalytic;
                  return switch (analyticData) {
                    AnalyticCreationInitial() => const CenteredIndicator(),
                    AnalyticCreationLoading() => const CenteredIndicator(),
                    AnalyticCreationSuccess() => _Body(analyticData.data),
                    AnalyticCreationError() => Center(
                      child: Text(
                        'Ошибка загрузки данных: ${analyticData.msj}',
                      ),
                    ),
                  };
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body(this.analyticData);

  final AnalyticEntity analyticData;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 20,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Column(
            spacing: AppSpacing.defaultPadding,
            children: [
              AnlyticCardsGrid(analyticData: analyticData),

              AnalyticSystemStat(analyticData: analyticData),

              AnalyticChartWidget(analyticData: analyticData),
            ],
          ),
        ),
      ],
    );
  }
}

void _onApplyFilter(BuildContext context) {
  final bloc = context.read<AnalyticBloc>();
  final prepareState = bloc.state.prepareState;

  final param = AnalyticParam(
    platformType: prepareState.policyType,
    startDate: prepareState.startDate,
    endDate: prepareState.endDate,
    dateRange: prepareState.dateRange,
  );

  log('param: ${prepareState.dateRange.toString()}');
  log('param: ${prepareState.policyType.toString()}');
  log('param: ${prepareState.startDate.toString()}');
  log('param: ${prepareState.endDate.toString()}');

  bloc.add(GetAnalyticEvent(param));
}
