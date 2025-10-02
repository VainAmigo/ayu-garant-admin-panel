import 'package:ayu_admin_panel/components/table/table.dart';
import 'reports_configs/report_tables_configs.dart';

/// Централизованный менеджер конфигураций таблиц
/// Здесь можно управлять всеми конфигурациями таблиц в одном месте
class TableConfigManager {
  
  /// Базовые конфигурации для отчетов по полисам
  static TableConfig get policyReport => PolicyTableConfig.policyReport;
  
  /// Расширенная конфигурация для отчетов по полисам
  static TableConfig get userReport => PolicyTableConfig.userReport;
  
  /// Финансовая конфигурация для отчетов по полисам
  static TableConfig get accountingReport => PolicyTableConfig.accountingReport;
  
  /// Административная конфигурация для отчетов по полисам
  static TableConfig get avarReport => PolicyTableConfig.avarReport;
  
  /// Получить конфигурацию по типу отчета
  static TableConfig getConfigByType(PolicyReportType type) {
    switch (type) {
      case PolicyReportType.basic:
        return policyReport;
      case PolicyReportType.extended:
        return userReport;
      case PolicyReportType.financial:
        return accountingReport;
      case PolicyReportType.admin:
        return avarReport;
    }
  }
  
  /// Получить все доступные конфигурации
  static Map<PolicyReportType, TableConfig> get allConfigs => {
    PolicyReportType.basic: policyReport,
    PolicyReportType.extended: userReport,
    PolicyReportType.financial: accountingReport,
    PolicyReportType.admin: avarReport,
  };
}

/// Типы отчетов по полисам
enum PolicyReportType {
  basic,      // Базовая конфигурация
  extended,   // Расширенная конфигурация
  financial,  // Финансовая конфигурация
  admin,      // Административная конфигурация
}

/// Расширение для получения названий типов отчетов
extension PolicyReportTypeExtension on PolicyReportType {
  String get displayName {
    switch (this) {
      case PolicyReportType.basic:
        return 'Базовая';
      case PolicyReportType.extended:
        return 'Расширенная';
      case PolicyReportType.financial:
        return 'Финансовая';
      case PolicyReportType.admin:
        return 'Административная';
    }
  }
}
