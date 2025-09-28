import 'package:flutter/material.dart';
import 'package:ayu_admin_panel/themes/themes.dart';

class EmergencyCommissionerPage extends StatelessWidget {
  const EmergencyCommissionerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.car_repair_outlined,
              size: 80,
              color: AppColors.grey,
            ),
            SizedBox(height: 16),
            Text(
              'Страница аварийного комисара',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.grey,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Здесь будет управление аварийными случаями',
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
