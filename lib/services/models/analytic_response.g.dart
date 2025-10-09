// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analytic_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnalyticResponse _$AnalyticResponseFromJson(Map<String, dynamic> json) =>
    AnalyticResponse(
      platformType: PlatformTypeResponse.fromJson(
          json['platformType'] as Map<String, dynamic>),
      totalPolicies: json['totalPolicies'] as int,
      purchasedPolicies: json['purchasedPolicies'] as int,
      financialData: FinancialDataResponse.fromJson(
          json['financialData'] as Map<String, dynamic>),
      policyTypes: PolicyTypesResponse.fromJson(
          json['policyTypes'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AnalyticResponseToJson(AnalyticResponse instance) =>
    <String, dynamic>{
      'platformType': instance.platformType.toJson(),
      'totalPolicies': instance.totalPolicies,
      'purchasedPolicies': instance.purchasedPolicies,
      'financialData': instance.financialData.toJson(),
      'policyTypes': instance.policyTypes.toJson(),
    };

PlatformTypeResponse _$PlatformTypeResponseFromJson(
        Map<String, dynamic> json) =>
    PlatformTypeResponse(
      android: json['android'] as int?,
      ios: json['ios'] as int?,
    );

Map<String, dynamic> _$PlatformTypeResponseToJson(
        PlatformTypeResponse instance) =>
    <String, dynamic>{
      'android': instance.android,
      'ios': instance.ios,
    };

FinancialDataResponse _$FinancialDataResponseFromJson(
        Map<String, dynamic> json) =>
    FinancialDataResponse(
      totalPremiumSum: (json['totalPremiumSum'] as num).toDouble(),
      premiumSum: (json['premiumSum'] as num).toDouble(),
      usedBonuses: (json['usedBonuses'] as num).toDouble(),
      accruedBonuses: (json['accruedBonuses'] as num).toDouble(),
    );

Map<String, dynamic> _$FinancialDataResponseToJson(
        FinancialDataResponse instance) =>
    <String, dynamic>{
      'totalPremiumSum': instance.totalPremiumSum,
      'premiumSum': instance.premiumSum,
      'usedBonuses': instance.usedBonuses,
      'accruedBonuses': instance.accruedBonuses,
    };

PolicyTypesResponse _$PolicyTypesResponseFromJson(Map<String, dynamic> json) =>
    PolicyTypesResponse(
      osago: json['osago'] as int,
      kasko: json['kasko'] as int,
      kaskoMini: json['kaskoMini'] as int,
      dsago: json['dsago'] as int,
    );

Map<String, dynamic> _$PolicyTypesResponseToJson(
        PolicyTypesResponse instance) =>
    <String, dynamic>{
      'osago': instance.osago,
      'kasko': instance.kasko,
      'kaskoMini': instance.kaskoMini,
      'dsago': instance.dsago,
    };

AnalyticBody _$AnalyticBodyFromJson(
        Map<String, dynamic> json) =>
    AnalyticBody(
      platformType: json['platformType'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      dateRange: json['dateRange'] as String?,
    );

Map<String, dynamic> _$AnalyticBodyToJson(
        AnalyticBody instance) =>
    <String, dynamic>{
      'platformType': instance.platformType,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'dateRange': instance.dateRange,
    };
