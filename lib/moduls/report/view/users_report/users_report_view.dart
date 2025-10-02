import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class UsersReportView extends StatelessWidget {
  const UsersReportView({super.key});

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
            'Отчет по пользователям',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Статистика и аналитика пользовательской активности',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.grey,
            ),
          ),
          const SizedBox(height: 20),
          _buildReportCard(
            'Всего пользователей',
            'Общее количество зарегистрированных',
            Icons.people,
            '5,678',
          ),
          const SizedBox(height: 12),
          _buildReportCard(
            'Активные пользователи',
            'Пользователи с активностью за последний месяц',
            Icons.person,
            '3,456',
          ),
          const SizedBox(height: 12),
          _buildReportCard(
            'Новые регистрации',
            'Зарегистрировались за текущий месяц',
            Icons.person_add,
            '234',
          ),
          const SizedBox(height: 12),
          _buildReportCard(
            'Неактивные пользователи',
            'Без активности более 3 месяцев',
            Icons.person_off,
            '1,234',
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
