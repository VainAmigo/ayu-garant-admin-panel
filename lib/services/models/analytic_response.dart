import 'package:ayu_admin_panel/services/services.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'analytic_response.g.dart';

@JsonSerializable()
@immutable
final class AnalyticResponse {
  const AnalyticResponse({
    required this.platformType,
    required this.totalPolicies,
    required this.purchasedPolicies,
    required this.financialData,
    required this.policyTypes,
  });

  factory AnalyticResponse.fromJson(Map<String, dynamic> json) => _$AnalyticResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AnalyticResponseToJson(this);

  final PlatformTypeResponse platformType;
  final int totalPolicies;
  final int purchasedPolicies;
  final FinancialDataResponse financialData;
  final PolicyTypesResponse policyTypes;

  AnalyticEntity toEntiy() {
    return AnalyticEntity(
      platformType: platformType.toEntity(),
      totalPolicies: totalPolicies,
      purchasedPolicies: purchasedPolicies,
      financialData: financialData.toEntity(),
      policyTypes: policyTypes.toEntity(),
    );
  }
}

@JsonSerializable()
@immutable
final class PlatformTypeResponse {
  const PlatformTypeResponse({
    required this.android,
    required this.ios,
  });

  factory PlatformTypeResponse.fromJson(Map<String, dynamic> json) => _$PlatformTypeResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PlatformTypeResponseToJson(this);

  final int? android;
  final int? ios;

  PlatformTypeEntity toEntity() {
    return PlatformTypeEntity(
      android: android,
      ios: ios,
    );
  }
}

@JsonSerializable()
@immutable
final class FinancialDataResponse {
  const FinancialDataResponse({
    required this.totalPremiumSum,
    required this.premiumSum,
    required this.usedBonuses,
    required this.accruedBonuses,
  });

  factory FinancialDataResponse.fromJson(Map<String, dynamic> json) => _$FinancialDataResponseFromJson(json);
  Map<String, dynamic> toJson() => _$FinancialDataResponseToJson(this);

  final double totalPremiumSum;
  final double premiumSum;
  final double usedBonuses;
  final double accruedBonuses;

  FinancialDataEntity toEntity() {
    return FinancialDataEntity(
      totalPremiumSum: totalPremiumSum,
      premiumSum: premiumSum,
      usedBonuses: usedBonuses,
      accruedBonuses: accruedBonuses,
    );
  }
}

@JsonSerializable()
@immutable
final class PolicyTypesResponse {
  const PolicyTypesResponse({
    required this.osago,
    required this.kasko,
    required this.kaskoMini,
    required this.dsago,
  });

  factory PolicyTypesResponse.fromJson(Map<String, dynamic> json) => _$PolicyTypesResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PolicyTypesResponseToJson(this);

  final int osago;
  final int kasko;
  final int kaskoMini;
  final int dsago;

  PolicyTypesEntity toEntity() {
    return PolicyTypesEntity(
      osago: osago,
      kasko: kasko,
      kaskoMini: kaskoMini,
      dsago: dsago,
    );
  }
}