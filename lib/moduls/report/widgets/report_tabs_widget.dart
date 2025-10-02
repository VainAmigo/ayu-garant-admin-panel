import 'package:ayu_admin_panel/components/components.dart';
import 'package:flutter/material.dart';

class ReportTabsWidget extends StatelessWidget {
  const ReportTabsWidget({
    super.key,
    required this.selectedIndex,
    required this.onTabChanged,
  });

  final int selectedIndex;
  final Function(int) onTabChanged;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      {
        'title': 'Отчет по полисам',
        'icon': Icons.analytics_outlined,
      },
      {
        'title': 'Отчет по пользавателям',
        'icon': Icons.people_alt,
      },
      {
        'title': 'Отчет для аварийного комисара',
        'icon': Icons.car_crash,
      },
      {
        'title': 'Отчет для бугалтерии',
        'icon': Icons.account_balance_wallet,
      },
    ];

    return Row(
      mainAxisSize: MainAxisSize.max,
      spacing: 20,
      children: tabs.asMap().entries.map((entry) {
        final index = entry.key;
        final tab = entry.value;
        final isSelected = selectedIndex == index;

        return Expanded(
          child: ReportCard(
            isSelected: isSelected,
            title: tab['title'] as String,
            icon: tab['icon'] as IconData,
            onTap: () => onTabChanged(index),
          ),
        );
      }).toList(),
    );
  }
}
