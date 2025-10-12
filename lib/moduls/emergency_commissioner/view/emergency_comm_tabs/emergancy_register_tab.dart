import 'package:ayu_admin_panel/components/components.dart';
import 'package:ayu_admin_panel/config/config.dart';
import 'package:ayu_admin_panel/moduls/moduls.dart';
import 'package:ayu_admin_panel/services/services.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmergencyRegisterTab extends StatefulWidget {
  const EmergencyRegisterTab({super.key});

  @override
  State<EmergencyRegisterTab> createState() => _EmergencyRegisterTabState();
}

class _EmergencyRegisterTabState extends State<EmergencyRegisterTab> {

  final TextEditingController _policyNumberController = TextEditingController();

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
            filterButtonText: 'Поиск',
          ),
          BlocBuilder<EmergancyCommCubit, EmergancyCommState>(
            builder: (context, state) {
              return switch (state) {
                EmergancyCommInitial() => const SizedBox.shrink(),
                EmergancyCommLoading() => const CenteredIndicator(),
                EmergancyCommLoaded() => EmergencyRegisterTableWidget(
                  data: state.data,
                  onTap: (index) => _onTableTap(context, index, state.data[index]),
                ),
                EmergancyCommError() => Center(
                  child: Text('Ошибка загрузки данных: ${state.error}'),
                ),
              };
            },
          ),
        ],
      ),
    );
  }

  void _onTableTap(BuildContext context, int index, AvarSearchEntity avarSearch) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        content: SizedBox(
          width: Responsive.isDesktop(context) ? MediaQuery.of(context).size.width * 0.4 : MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          child: EmergencyRegisterDetailWidget(avarSearch: avarSearch),
        ),
      ),
    );
  }

  void _onApplyFilter(BuildContext context) {
    final bloc = context.read<EmergancyCommCubit>();
    final param = AvarSearchParam(
      policyNumber: _policyNumberController.text,
    );
    bloc.getAvarSearch(param: param);
  }

  void _resetFilters() {
    _policyNumberController.clear();
  }

  List<Widget> _buildFilterWidgets() {
    return [
      CustomSearchBar(controller: _policyNumberController, hintText: 'Поиск по номеру полиса'),
    ];
  }
}