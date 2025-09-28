import 'package:flutter/material.dart';
import 'package:ayu_admin_panel/themes/themes.dart';

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.assignment_outlined,
              size: 80,
              color: AppColors.grey,
            ),
            SizedBox(height: 16),
            Text(
              'Страница отчетов',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.grey,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Здесь будут отображаться различные отчеты',
              style: TextStyle(
                fontSize: 16,
                color: AppColors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
