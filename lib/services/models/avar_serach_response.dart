import 'package:ayu_admin_panel/services/services.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'avar_serach_response.g.dart';

@JsonSerializable()
@immutable
final class AvarSearchResponse {
  const AvarSearchResponse({
    this.registrationId,
    this.holderName,
    this.holderPin,
    this.culpritName,
    this.culpritPin,
    this.availableDriversPins,
    this.availableDrivers,
    this.policyNumber,
    this.policyStartDate,
    this.policyEndDate,
    this.carModel,
    this.carBrand,
    this.carNumber,
    this.vinNumber,
    this.vidNumber,
    this.accidentDate,
    this.registrationDate,
    this.paymentDate,
    this.accidentCost,
    this.paymentAmount,
    this.policyStatus,
    required this.avarStatus,
  });

  factory AvarSearchResponse.fromJson(Map<String, dynamic> json) => _$AvarSearchResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AvarSearchResponseToJson(this);

  final String? registrationId;

  final String? holderName;
  final int? holderPin;
  final String? culpritName;
  final int? culpritPin;
  final List<int>? availableDriversPins;

  final String? availableDrivers;
  final String? policyNumber;
  final DateTime? policyStartDate;
  final DateTime? policyEndDate;
  final PolicyStatus? policyStatus;

  final String? carModel;
  final String? carBrand;
  final String? carNumber;
  final String? vinNumber;
  final String? vidNumber;

  final DateTime? accidentDate;
  final DateTime? registrationDate;
  final DateTime? paymentDate;

  final double? accidentCost;
  final double? paymentAmount;

  final AvarStatus avarStatus;

  AvarSearchEntity toEntity() {
    return AvarSearchEntity(
      registrationId: registrationId,
      holderName: holderName,
      holderPin: holderPin,
      culpritName: culpritName,
      culpritPin: culpritPin,
      availableDriversPins: availableDriversPins,
      availableDrivers: availableDrivers,
      policyNumber: policyNumber,
      policyStartDate: policyStartDate,
      policyEndDate: policyEndDate,
      carModel: carModel,
      carBrand: carBrand,
      carNumber: carNumber,
      vinNumber: vinNumber,
      vidNumber: vidNumber,
      accidentDate: accidentDate,
      registrationDate: registrationDate,
      paymentDate: paymentDate,
      accidentCost: accidentCost,
      paymentAmount: paymentAmount,
      avarStatus: avarStatus,
      policyStatus: policyStatus,
    );
  }
}

@JsonSerializable(explicitToJson: true)
@immutable
final class AvarSearchBody {
  const AvarSearchBody({
    this.registrationId,
    this.name,
    this.policyNumber,
    this.startDate,
    this.endDate,
  });

  factory AvarSearchBody.fromJson(Map<String, dynamic> json) => _$AvarSearchBodyFromJson(json);

  Map<String, dynamic> toJson() => _$AvarSearchBodyToJson(this);

  final String? registrationId;
  final String? name;
  final String? policyNumber;
  final DateTime? startDate;
  final DateTime? endDate;

  AvarSearchParam toParam() {
    return AvarSearchParam(
      registrationId: registrationId,
      name: name,
      policyNumber: policyNumber,
      startDate: startDate,
      endDate: endDate,
    );
  }
}

@JsonEnum()
enum AvarStatus {
  @JsonValue('NEUTRAL')
  neutral,
  @JsonValue('DRAFTED')
  drafted,
  @JsonValue('PAYED')
  payed,
}