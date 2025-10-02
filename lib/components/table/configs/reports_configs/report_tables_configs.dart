import 'package:ayu_admin_panel/components/table/table.dart';
import 'package:ayu_admin_panel/themes/themes.dart';
import 'package:flutter/material.dart';

class PolicyTableConfig {
  static TableConfig get policyReport => TableConfig(
    columns: [
      TableColumnConfig(
        key: 'policyNumber',
        title: 'Номер полиса',
        width: 150,
      ),
      TableColumnConfig(
        key: 'issueDate',
        title: 'Дата оформления',
        width: 120,
      ),
      TableColumnConfig(
        key: 'validityPeriod',
        title: 'Период действия',
        width: 200,
      ),
      TableColumnConfig(
        key: 'amount',
        title: 'Сумма',
        width: 120,
      ),
      TableColumnConfig(
        key: 'policyType',
        title: 'Тип полиса',
        width: 120,
      ),
      TableColumnConfig(
        key: 'car',
        title: 'Автомобиль',
        width: 250,
      ),
      TableColumnConfig(
        key: 'owner',
        title: 'Владелец',
        width: 250,
      ),
      TableColumnConfig(
        key: 'status',
        title: 'Статус',
        width: 120,
        customBuilder: (data) => _buildStatusChip(data),
      ),
    ],
  );

  /// Конфигурация для отчета по пользователям
  static TableConfig get userReport => TableConfig(
    columns: [
      TableColumnConfig(
        key: 'policyNumber',
        title: 'Номер полиса',
        width: 140,
      ),
      TableColumnConfig(
        key: 'issueDate',
        title: 'Дата оформления',
        width: 110,
      ),
      TableColumnConfig(
        key: 'amount',
        title: 'Сумма',
        width: 100,
      ),
      TableColumnConfig(
        key: 'policyType',
        title: 'Тип полиса',
        width: 110,
      ),
      TableColumnConfig(
        key: 'owner',
        title: 'Владелец',
        width: 200,
      ),
      TableColumnConfig(
        key: 'user',
        title: 'Пользователь',
        width: 200,
      ),
      TableColumnConfig(
        key: 'phoneNumber',
        title: 'Телефон',
        width: 140,
      ),
      TableColumnConfig(
        key: 'status',
        title: 'Статус',
        width: 100,
        customBuilder: (data) => _buildStatusChip(data),
      ),
    ],
  );

  /// Конфигурация для финансового отчета
  static TableConfig get accountingReport => TableConfig(
    columns: [
      TableColumnConfig(
        key: 'policyNumber',
        title: 'Номер полиса',
        width: 130,
      ),
      TableColumnConfig(
        key: 'amount',
        title: 'Сумма',
        width: 100,
        customBuilder: (data) => _buildAmountWidget(data),
      ),
      TableColumnConfig(
        key: 'premiumAmount',
        title: 'Премия',
        width: 100,
        customBuilder: (data) => _buildAmountWidget(data),
      ),
      TableColumnConfig(
        key: 'premiumWithoutTax',
        title: 'Без налога',
        width: 100,
        customBuilder: (data) => _buildAmountWidget(data),
      ),
      TableColumnConfig(
        key: 'usedBonuses',
        title: 'Исп. бонусы',
        width: 100,
        customBuilder: (data) => _buildBonusWidget(data, isUsed: true),
      ),
      TableColumnConfig(
        key: 'earnedBonuses',
        title: 'Нач. бонусы',
        width: 100,
        customBuilder: (data) => _buildBonusWidget(data, isUsed: false),
      ),
      TableColumnConfig(
        key: 'paymentSystem',
        title: 'Платеж. система',
        width: 120,
        customBuilder: (data) => _buildPaymentSystemChip(data),
      ),
      TableColumnConfig(
        key: 'status',
        title: 'Статус',
        width: 100,
        customBuilder: (data) => _buildStatusChip(data),
      ),
    ],
  );

  /// Конфигурация для аварийного комиссара отчета
  static TableConfig get avarReport => TableConfig(
    columns: [
      TableColumnConfig(
        key: 'id',
        title: 'ID',
        width: 80,
      ),
      TableColumnConfig(
        key: 'policyNumber',
        title: 'Номер полиса',
        width: 130,
      ),
      TableColumnConfig(
        key: 'owner',
        title: 'Владелец',
        width: 180,
      ),
      TableColumnConfig(
        key: 'user',
        title: 'Пользователь',
        width: 180,
      ),
      TableColumnConfig(
        key: 'phoneNumber',
        title: 'Телефон',
        width: 130,
      ),
      TableColumnConfig(
        key: 'pin',
        title: 'PIN',
        width: 120,
        customBuilder: (data) => _buildPinWidget(data),
      ),
      TableColumnConfig(
        key: 'roles',
        title: 'Роль',
        width: 120,
        customBuilder: (data) => _buildRoleChip(data),
      ),
      TableColumnConfig(
        key: 'status',
        title: 'Статус',
        width: 100,
        customBuilder: (data) => _buildStatusChip(data),
      ),
    ],
  );

  // Кастомные виджеты
  static Widget _buildStatusChip(dynamic status) {
    if (status == null) return const SizedBox.shrink();
    
    final statusText = status.toString();
    Color backgroundColor;
    
    switch (statusText.toLowerCase()) {
      case 'активный':
        backgroundColor = AppColors.green.withAlpha(50);
        break;
      case 'неактивный':
        backgroundColor = AppColors.oragne.withAlpha(50);
        break;
      default:
        backgroundColor = AppColors.grey100;
    }
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        statusText,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  static Widget _buildAmountWidget(dynamic amount) {
    if (amount == null) return const Text('-');
    
    return Text(
      amount.toString(),
      style: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.primary,
      ),
    );
  }

  static Widget _buildBonusWidget(dynamic bonus, {required bool isUsed}) {
    if (bonus == null) return const Text('-');
    
    final color = isUsed ? AppColors.red : AppColors.green;
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withAlpha(10),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withAlpha(30)),
      ),
      child: Text(
        bonus.toString(),
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: color,
        ),
      ),
    );
  }

  static Widget _buildPaymentSystemChip(dynamic paymentSystem) {
    if (paymentSystem == null) return const Text('-');
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.primary.withAlpha(10),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.primary.withAlpha(30)),
      ),
      child: Text(
        paymentSystem.toString(),
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: AppColors.primary,
        ),
      ),
    );
  }

  static Widget _buildPinWidget(dynamic pin) {
    if (pin == null) return const Text('-');
    
    final pinText = pin.toString();
    final maskedPin = pinText.length > 4 
        ? '${pinText.substring(0, 4)}****${pinText.substring(pinText.length - 4)}'
        : pinText;
    
    return Text(
      maskedPin,
      style: const TextStyle(
        fontSize: 12,
        fontFamily: 'monospace',
        color: AppColors.grey,
      ),
    );
  }

  static Widget _buildRoleChip(dynamic role) {
    if (role == null) return const Text('-');
    
    final roleText = role.toString();
    Color backgroundColor;
    
    switch (roleText.toLowerCase()) {
      case 'администратор':
        backgroundColor = Colors.red;
        break;
      case 'менеджер':
        backgroundColor = Colors.blue;
        break;
      case 'оператор':
        backgroundColor = Colors.green;
        break;
      case 'агент':
        backgroundColor = Colors.orange;
        break;
      case 'клиент':
        backgroundColor = Colors.grey;
        break;
      default:
        backgroundColor = AppColors.grey;
    }
    
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        roleText,
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    );
  }
}