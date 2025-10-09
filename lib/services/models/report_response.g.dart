// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportResponse _$ReportResponseFromJson(Map<String, dynamic> json) =>
    ReportResponse(
      policyNumber: json['policyNumber'] as String?,
      creationDate: json['creationDate'] == null
          ? null
          : DateTime.parse(json['creationDate'] as String),
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      policyType: json['policyType'] as String?,
      policyStatus: $enumDecodeNullable(_$PolicyStatusEnumMap, json['policyStatus']),
      policyCost: (json['policyCost'] as num?)?.toDouble(),
      premiumWithoutTax: (json['premiumWithoutTax'] as num?)?.toDouble(),
      usedBonuses: (json['usedBonuses'] as num?)?.toDouble(),
      accruedBonuses: (json['accruedBonuses'] as num?)?.toDouble(),
      usedCashBack: (json['usedCashBack'] as num?)?.toDouble(),
      accruedCashBack: (json['accruedCashBack'] as num?)?.toDouble(),
      paymentSystem: json['paymentSystem'] as String?,
      policyHolderName: json['policyHolderName'] as String?,
      userName: json['userName'] as String?,
      policyHolderPin: json['policyHolderPin'] as String?,
      userPin: json['userPin'] as String?,
      carModel: json['carModel'] as String?,
      carBrand: json['carBrand'] as String?,
      carNumber: json['carNumber'] as String?,
    );

Map<String, dynamic> _$ReportResponseToJson(ReportResponse instance) =>
    <String, dynamic>{
      'policyNumber': instance.policyNumber,
      'creationDate': instance.creationDate?.toIso8601String(),
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'policyType': instance.policyType,
      'policyStatus': _$PolicyStatusEnumMap[instance.policyStatus],
      'policyCost': instance.policyCost,
      'premiumWithoutTax': instance.premiumWithoutTax,
      'usedBonuses': instance.usedBonuses,
      'accruedBonuses': instance.accruedBonuses,
      'usedCashBack': instance.usedCashBack,
      'accruedCashBack': instance.accruedCashBack,
      'paymentSystem': instance.paymentSystem,
      'policyHolderName': instance.policyHolderName,
      'userName': instance.userName,
      'policyHolderPin': instance.policyHolderPin,
      'userPin': instance.userPin,
      'carModel': instance.carModel,
      'carBrand': instance.carBrand,
      'carNumber': instance.carNumber,
    };

ReportBody _$ReportBodyFromJson(Map<String, dynamic> json) =>
    ReportBody(
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      policyType: json['policyType'] as String?,
      policyStatus: json['policyStatus'] as String?,
      dateRange: json['dateRange'] as String?,
      paymentSystem: json['paymentSystem'] as String?,
    );

Map<String, dynamic> _$ReportBodyToJson(ReportBody instance) =>
    <String, dynamic>{
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'policyType': instance.policyType,
      'policyStatus': instance.policyStatus,
      'dateRange': instance.dateRange,
      'paymentSystem': instance.paymentSystem,
    };

const _$PolicyStatusEnumMap = {
  PolicyStatus.active: 'ACTIVE',
  PolicyStatus.unPaid: 'UNPAID',
  PolicyStatus.expired: 'EXPIRED',
};
