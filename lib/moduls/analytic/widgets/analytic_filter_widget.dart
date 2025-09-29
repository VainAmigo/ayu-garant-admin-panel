import 'package:ayu_admin_panel/components/components.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class AnalyticFilter extends StatefulWidget {
  const AnalyticFilter({super.key});

  @override
  State<AnalyticFilter> createState() => _AnalyticFilterState();
}

class _AnalyticFilterState extends State<AnalyticFilter> {
  String? selectedStatus;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        spacing: 20,
        children: [
          CustomDropDown<String>(
            value: selectedStatus,
            onChanged: (value) {
              setState(() {
                selectedStatus = value;
              });
            },
          ),
          const DateRangePickerChip(),
          Row(
            spacing: 5,
            mainAxisSize: MainAxisSize.min,
            children: [
              DotTag(isSelected: true, text: 'Д'),
              DotTag(isSelected: false, text: 'Н'),
              DotTag(isSelected: false, text: 'М'),
              DotTag(isSelected: false, text: 'Г'),
              DotTag(isSelected: false, text: 'все'),
            ],
          ),
          const Spacer(),
          PrimaryButton(text: 'Сформировть', onPressed: () {}),
        ],
      ),
    );
  }
}
