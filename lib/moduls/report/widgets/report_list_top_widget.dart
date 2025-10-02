import 'package:ayu_admin_panel/components/components.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class ReportListTopWidget extends StatelessWidget {
  const ReportListTopWidget({super.key, required this.count});
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'Найдено полисы: $count',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.normal,
            color: AppColors.black,
          ),
        ),
        const Spacer(),
        PrimaryButton(
          text: 'Экспорт в Excel',
          icon: Icons.download,
          onPressed: () {},
        ),
      ],
    );
  }
}
