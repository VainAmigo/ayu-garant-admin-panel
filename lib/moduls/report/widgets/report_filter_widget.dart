import 'package:ayu_admin_panel/components/components.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class ReportFilterWidget extends StatefulWidget {
  const ReportFilterWidget({super.key});

  @override
  State<ReportFilterWidget> createState() => _ReportFilterWidgetState();
}

class _ReportFilterWidgetState extends State<ReportFilterWidget> {
  String? selectedStatus;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      width: double.infinity,
      child: Wrap(
        spacing: 20,
        runSpacing: 10,
        alignment: WrapAlignment.start,
        children: [
          DotTagFilter(
            initialPeriod: PeriodFilter.month,
            onPeriodChanged: (PeriodFilter period) {
              print('Выбран период: $period');
            },
          ),
          const DateRangePickerChip(),
          CustomDropDown<String>(
            value: selectedStatus,
            onChanged: (value) {
              setState(() {
                selectedStatus = value;
              });
            },
          ),
          const DotTextTag(text: 'Только активные', isSelected: true),
          const Spacer(),
          PrimaryButton(text: 'Сформировть', onPressed: () {}),
        ],
      ),
    );
  }
}
