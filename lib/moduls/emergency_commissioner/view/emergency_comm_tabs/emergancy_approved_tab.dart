import 'package:ayu_admin_panel/components/components.dart';
import 'package:ayu_admin_panel/config/config.dart';
import 'package:ayu_admin_panel/moduls/moduls.dart';
import 'package:ayu_admin_panel/services/services.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmergencyApprovedTab extends StatefulWidget {
  const EmergencyApprovedTab({super.key});

  @override
  State<EmergencyApprovedTab> createState() => _EmergencyApprovedTabState();
}

class _EmergencyApprovedTabState extends State<EmergencyApprovedTab> {
  final TextEditingController _registrationIdController =
      TextEditingController();
  final TextEditingController _policyNumberController = TextEditingController();
  DateTime? _accidentDate;
  DateTime? _paymentDate;

  final AvarSearchParam _defaultParams = AvarSearchParam(
    registrationId: '',
    policyNumber: '',
    startDate: null,
  );

  @override
  void initState() {
    super.initState();
    context.read<EmergancyCommCubit>().getApprovedAvar(param: _defaultParams);
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
            filterButtonText: 'Поиск',
          ),
          BlocBuilder<EmergancyCommCubit, EmergancyCommState>(
            builder: (context, state) {
              return switch (state) {
                EmergancyCommInitial() => const SizedBox.shrink(),
                EmergancyCommLoading() => const CenteredIndicator(),
                EmergancyCommLoaded() => EmergencyApprovedTableWidget(
                  data: state.data,
                  onTap: (index) =>
                      _onTableTap(context, index, state.data[index]),
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

  void _onTableTap(
    BuildContext context,
    int index,
    AvarSearchEntity avarSearch,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        content: SizedBox(
          width: Responsive.isDesktop(context)
              ? MediaQuery.of(context).size.width * 0.4
              : MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          child: EmergancyApprovedDetailWidget(avarSearch: avarSearch),
        ),
      ),
    );
  }

  void _onApplyFilter(BuildContext context) {
    final bloc = context.read<EmergancyCommCubit>();
    final param = AvarSearchParam(
      registrationId: _registrationIdController.text,
      policyNumber: _policyNumberController.text,
      startDate: _accidentDate,
    );
    bloc.getApprovedAvar(param: param);
  }

  void _resetFilters() {
    setState(() {
      _registrationIdController.clear();
      _policyNumberController.clear();
      _accidentDate = null;
      _paymentDate = null;
    });
  }

  List<Widget> _buildFilterWidgets() {
    return [
      CustomSearchBar(
        controller: _registrationIdController,
        hintText: 'Поиск по РЗНУ',
      ),
      CustomSearchBar(
        controller: _policyNumberController,
        hintText: 'Поиск по номеру полиса',
      ),
      DatePicker(
        hintText: 'По дате аварии',
        initialDate: _accidentDate,
        onDateChanged: (date) {
          setState(() {
            _accidentDate = date;
          });
        },
        onReset: () {
          setState(() {
            _accidentDate = null;
          });
        },
      ),
      DatePicker(
        hintText: 'По дате выплаты',
        initialDate: _paymentDate,
        onDateChanged: (date) {
          setState(() {
            _paymentDate = date;
          });
        },
        onReset: () {
          setState(() {
            _paymentDate = null;
          });
        },
      ),
    ];
  }
}
