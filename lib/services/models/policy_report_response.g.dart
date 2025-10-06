// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'policy_report_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PolicyReportResponse _$PolicyReportResponseFromJson(Map<String, dynamic> json) =>
    PolicyReportResponse(
      policyNumber: json['policyNumber'] as String,
      creationDate: DateTime.parse(json['creationDate'] as String),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      policyType: json['policyType'] as String,
      policyCost: (json['policyCost'] as num).toDouble(),
      model: json['model'] as String,
      brand: json['brand'] as String,
      policyHolderName: json['policyHolderName'] as String,
      policyStatus: $enumDecode(_$PolicyStatusEnumMap, json['policyStatus']),
    );

Map<String, dynamic> _$PolicyReportResponseToJson(PolicyReportResponse instance) =>
    <String, dynamic>{
      'policyNumber': instance.policyNumber,
      'creationDate': instance.creationDate.toIso8601String(),
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'policyType': instance.policyType,
      'policyCost': instance.policyCost,
      'model': instance.model,
      'brand': instance.brand,
      'policyHolderName': instance.policyHolderName,
      'policyStatus': _$PolicyStatusEnumMap[instance.policyStatus]!,
    };

PolicyReportResponseBody _$PolicyReportResponseBodyFromJson(Map<String, dynamic> json) =>
    PolicyReportResponseBody(
      policyNumber: json['policyNumber'] as String,
      creationDate: DateTime.parse(json['creationDate'] as String),
      startDate: DateTime.parse(json['startDate'] as String),
      endDate: DateTime.parse(json['endDate'] as String),
      policyType: json['policyType'] as String,
      policyCost: (json['policyCost'] as num).toDouble(),
      model: json['model'] as String,
      brand: json['brand'] as String,
      policyHolderName: json['policyHolderName'] as String,
      policyStatus: $enumDecode(_$PolicyStatusEnumMap, json['policyStatus']),
    );

Map<String, dynamic> _$PolicyReportResponseBodyToJson(PolicyReportResponseBody instance) =>
    <String, dynamic>{
      'policyNumber': instance.policyNumber,
      'creationDate': instance.creationDate.toIso8601String(),
      'startDate': instance.startDate.toIso8601String(),
      'endDate': instance.endDate.toIso8601String(),
      'policyType': instance.policyType,
      'policyCost': instance.policyCost,
      'model': instance.model,
      'brand': instance.brand,
      'policyHolderName': instance.policyHolderName,
      'policyStatus': _$PolicyStatusEnumMap[instance.policyStatus]!,
    };

const _$PolicyStatusEnumMap = {
  PolicyStatus.active: 'ACTIVE',
  PolicyStatus.unPaid: 'UNPAID',
  PolicyStatus.expired: 'EXPIRED',
};
