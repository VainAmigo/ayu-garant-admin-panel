import 'package:ayu_admin_panel/services/services.dart';
import 'package:flutter/foundation.dart';

@immutable
final class AvarSearchEntity {
  const AvarSearchEntity({
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
    this.policyStatus,
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
    required this.avarStatus,
  });

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

  bool get isActive {
    return policyStatus == PolicyStatus.active;
  }
}

@immutable
final class AvarSearchParam {
  const AvarSearchParam({
    this.registrationId,
    this.name,
    this.policyNumber,
    this.startDate,
    this.endDate,
  });

  final String? registrationId;
  final String? name;
  final String? policyNumber;
  final DateTime? startDate;
  final DateTime? endDate;

  AvarSearchBody toBody() {
    return AvarSearchBody(
      registrationId: registrationId,
      name: name,
      policyNumber: policyNumber,
      startDate: startDate,
      endDate: endDate,
    );
  }
}