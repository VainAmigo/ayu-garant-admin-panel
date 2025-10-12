// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'avar_serach_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AvarSearchResponse _$AvarSearchResponseFromJson(Map<String, dynamic> json) =>
    AvarSearchResponse(
      registrationId: json['registrationId'] as String?,
      holderName: json['holderName'] as String?,
      holderPin: (json['holderPin'] as num?)?.toInt(),
      culpritName: json['culpritName'] as String?,
      culpritPin: (json['culpritPin'] as num?)?.toInt(),
      availableDriversPins: (json['availableDriversPins'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList(),
      availableDrivers: json['availableDrivers'] as String?,
      policyNumber: json['policyNumber'] as String?,
      policyStartDate: json['policyStartDate'] == null
          ? null
          : DateTime.parse(json['policyStartDate'] as String),
      policyEndDate: json['policyEndDate'] == null
          ? null
          : DateTime.parse(json['policyEndDate'] as String),
      carModel: json['carModel'] as String?,
      carBrand: json['carBrand'] as String?,
      carNumber: json['carNumber'] as String?,
      vinNumber: json['vinNumber'] as String?,
      vidNumber: json['vidNumber'] as String?,
      accidentDate: json['accidentDate'] == null
          ? null
          : DateTime.parse(json['accidentDate'] as String),
      registrationDate: json['registrationDate'] == null
          ? null
          : DateTime.parse(json['registrationDate'] as String),
      paymentDate: json['paymentDate'] == null
          ? null
          : DateTime.parse(json['paymentDate'] as String),
      accidentCost: (json['accidentCost'] as num?)?.toDouble(),
      paymentAmount: (json['paymentAmount'] as num?)?.toDouble(),
      policyStatus: $enumDecodeNullable(
        _$PolicyStatusEnumMap,
        json['policyStatus'],
      ),
      avarStatus: $enumDecode(_$AvarStatusEnumMap, json['avarStatus']),
    );

Map<String, dynamic> _$AvarSearchResponseToJson(AvarSearchResponse instance) =>
    <String, dynamic>{
      'registrationId': instance.registrationId,
      'holderName': instance.holderName,
      'holderPin': instance.holderPin,
      'culpritName': instance.culpritName,
      'culpritPin': instance.culpritPin,
      'availableDriversPins': instance.availableDriversPins,
      'availableDrivers': instance.availableDrivers,
      'policyNumber': instance.policyNumber,
      'policyStartDate': instance.policyStartDate?.toIso8601String(),
      'policyEndDate': instance.policyEndDate?.toIso8601String(),
      'policyStatus': _$PolicyStatusEnumMap[instance.policyStatus],
      'carModel': instance.carModel,
      'carBrand': instance.carBrand,
      'carNumber': instance.carNumber,
      'vinNumber': instance.vinNumber,
      'vidNumber': instance.vidNumber,
      'accidentDate': instance.accidentDate?.toIso8601String(),
      'registrationDate': instance.registrationDate?.toIso8601String(),
      'paymentDate': instance.paymentDate?.toIso8601String(),
      'accidentCost': instance.accidentCost,
      'paymentAmount': instance.paymentAmount,
      'avarStatus': _$AvarStatusEnumMap[instance.avarStatus]!,
    };

const _$PolicyStatusEnumMap = {
  PolicyStatus.active: 'ACTIVE',
  PolicyStatus.unPaid: 'UNPAID',
  PolicyStatus.expired: 'EXPIRED',
};

const _$AvarStatusEnumMap = {
  AvarStatus.neutral: 'NEUTRAL',
  AvarStatus.drafted: 'DRAFTED',
  AvarStatus.payed: 'PAYED',
};

AvarSearchBody _$AvarSearchBodyFromJson(Map<String, dynamic> json) =>
    AvarSearchBody(
      registrationId: json['registrationId'] as String?,
      name: json['name'] as String?,
      policyNumber: json['policyNumber'] as String?,
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
    );

Map<String, dynamic> _$AvarSearchBodyToJson(AvarSearchBody instance) =>
    <String, dynamic>{
      'registrationId': instance.registrationId,
      'name': instance.name,
      'policyNumber': instance.policyNumber,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
    };
