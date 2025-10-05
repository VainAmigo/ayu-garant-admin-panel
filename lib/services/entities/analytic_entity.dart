import 'package:flutter/foundation.dart';

@immutable
final class AnalyticEntity {
  const AnalyticEntity({
    required this.platformType,
    required this.totalPolicies,
    required this.purchasedPolicies,
    required this.financialData,
    required this.policyTypes,
  });

  final PlatformTypeEntity platformType;
  final int totalPolicies;
  final int purchasedPolicies;
  final FinancialDataEntity financialData;
  final PolicyTypesEntity policyTypes;
}

@immutable
final class PlatformTypeEntity {
  const PlatformTypeEntity({
    this.android,
    this.ios,
  });

  final String? android;
  final String? ios;
}

@immutable
final class FinancialDataEntity {
  const FinancialDataEntity({
    required this.totalPremiumSum,
    required this.premiumSum,
    required this.usedBonuses,
    required this.accruedBonuses,
  });

  final double totalPremiumSum;
  final double premiumSum;
  final double usedBonuses;
  final double accruedBonuses;
}

@immutable
final class PolicyTypesEntity {
  const PolicyTypesEntity({
    required this.osago,
    required this.kasko,
    required this.kaskoMini,
    required this.dsago,
  });

  final int osago;
  final int kasko;
  final int kaskoMini;
  final int dsago;
}

final class AnalyticParam {
  const AnalyticParam({
    this.platformType,
    this.startDate,
    this.endDate,
    this.dateRange,
  });

  final String? platformType;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? dateRange;

  AnalyticParam toBody() {
    return AnalyticParam(
      platformType: platformType,
      startDate: startDate,
      endDate: endDate,
      dateRange: dateRange,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'platformType': platformType,
      'startDate': startDate?.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'dateRange': dateRange,
    };
  }
}
