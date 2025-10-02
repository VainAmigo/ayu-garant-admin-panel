import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class AvarReportView extends StatelessWidget {
  const AvarReportView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Отчет для аварийного комиссара',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Специализированные отчеты для аварийных комиссаров',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.grey,
            ),
          ),
          const SizedBox(height: 20),
          _buildReportCard(
            'Аварийные случаи',
            'Количество обработанных аварий',
            Icons.car_crash,
            '45',
          ),
          const SizedBox(height: 12),
          _buildReportCard(
            'В работе',
            'Аварии в процессе обработки',
            Icons.build,
            '12',
          ),
          const SizedBox(height: 12),
          _buildReportCard(
            'Завершенные',
            'Успешно обработанные случаи',
            Icons.check_circle,
            '33',
          ),
          const SizedBox(height: 12),
          _buildReportCard(
            'Среднее время обработки',
            'Время от обращения до решения',
            Icons.schedule,
            '2.5ч',
          ),
        ],
      ),
    );
  }

  Widget _buildReportCard(String title, String description, IconData icon, String value) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.grey100,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.grey),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.primary,
            size: 24,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.grey,
                  ),
                ),
              ],
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
