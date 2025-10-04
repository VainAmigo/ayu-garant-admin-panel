import 'package:ayu_admin_panel/components/components.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class AnalyticFilter extends StatelessWidget {
  const AnalyticFilter({super.key});

  @override
  Widget build(BuildContext context) {
    String? selectedStatus;
    return Container(
      padding: const EdgeInsets.all(AppSpacing.defaultPadding),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: AnalyticFilterWidget(selectedStatus: selectedStatus),
    );
  }
}

class AnalyticFilterWidget extends StatefulWidget {
  const AnalyticFilterWidget({super.key, this.selectedStatus});

  final String? selectedStatus;

  @override
  State<AnalyticFilterWidget> createState() => _AnalyticFilterWidgetState();
}

class _AnalyticFilterWidgetState extends State<AnalyticFilterWidget> {
  String? _selectedStatus;

  @override
  void initState() {
    super.initState();
    _selectedStatus = widget.selectedStatus;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Фильтр',
          style: AppTypography.black20w400,
          textAlign: TextAlign.start,
        ),
        const SizedBox(height: AppSpacing.defaultPadding),
        DotTagFilter(
          initialPeriod: PeriodFilter.month,
          onPeriodChanged: (PeriodFilter period) {
            print('Выбран период: $period');
          },
        ),
        const SizedBox(height: AppSpacing.defaultPadding),
        CustomDropDown<String>(
          value: _selectedStatus,
          onChanged: (value) {
            setState(() {
              _selectedStatus = value;
            });
          },
        ),
        const SizedBox(height: AppSpacing.defaultPadding),
        const DateRangePickerChip(),
        const SizedBox(height: AppSpacing.defaultPadding),
        PrimaryButton(text: 'Сформировть', onPressed: () {}),
      ],
    );
  }
}
