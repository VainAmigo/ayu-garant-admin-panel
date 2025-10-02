import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class AccountingReportView extends StatelessWidget {
  const AccountingReportView({super.key});

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
            'Отчет для бухгалтерии',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Финансовые отчеты и аналитика для бухгалтерского учета',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.grey,
            ),
          ),
          const SizedBox(height: 20),
          _buildReportCard(
            'Общий доход',
            'Сумма всех поступлений за период',
            Icons.attach_money,
            '₽2,456,789',
          ),
          const SizedBox(height: 12),
          _buildReportCard(
            'Страховые премии',
            'Поступления от страховых премий',
            Icons.account_balance_wallet,
            '₽1,234,567',
          ),
          const SizedBox(height: 12),
          _buildReportCard(
            'Выплаты',
            'Общая сумма выплат по страховым случаям',
            Icons.payment,
            '₽456,789',
          ),
          const SizedBox(height: 12),
          _buildReportCard(
            'Прибыль',
            'Чистая прибыль за период',
            Icons.trending_up,
            '₽765,433',
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
