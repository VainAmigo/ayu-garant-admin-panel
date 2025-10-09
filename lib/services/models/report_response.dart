import 'package:ayu_admin_panel/services/services.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'report_response.g.dart';

@JsonSerializable()
@immutable
final class ReportResponse {
  const ReportResponse({
    this.policyNumber,
    this.creationDate,
    this.startDate,
    this.endDate,
    this.policyType,
    this.policyStatus,
    this.policyCost,
    this.premiumWithoutTax,
    this.usedBonuses,
    this.accruedBonuses,
    this.usedCashBack,
    this.accruedCashBack,
    this.paymentSystem,
    this.policyHolderName,
    this.userName,
    this.policyHolderPin,
    this.userPin,
    this.carModel,
    this.carBrand,
    this.carNumber,
  });

  factory ReportResponse.fromJson(Map<String, dynamic> json) => _$ReportResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReportResponseToJson(this);

  final String? policyNumber;
  final DateTime? creationDate;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? policyType;
  final PolicyStatus? policyStatus;

  final double? policyCost;
  final double? premiumWithoutTax;
  final double? usedBonuses;
  final double? accruedBonuses;
  final double? usedCashBack;
  final double? accruedCashBack;

  final String? paymentSystem;

  final String? policyHolderName;
  final String? userName;
  final String? policyHolderPin;
  final String? userPin;

  final String? carModel;
  final String? carBrand;
  final String? carNumber;

  ReportEntity toEntity() {
    return ReportEntity(
      policyNumber: policyNumber,
      creationDate: creationDate,
      startDate: startDate,
      endDate: endDate,
      policyType: policyType,
      policyStatus: policyStatus,
      policyCost: policyCost,
      premiumWithoutTax: premiumWithoutTax,
      usedBonuses: usedBonuses,
      accruedBonuses: accruedBonuses,
      usedCashBack: usedCashBack,
      accruedCashBack: accruedCashBack,
      paymentSystem: paymentSystem,
      policyHolderName: policyHolderName,
      userName: userName,
      policyHolderPin: policyHolderPin,
      userPin: userPin,
      carModel: carModel,
      carBrand: carBrand,
      carNumber: carNumber,
    );
  }
}

@JsonSerializable(explicitToJson: true)
@immutable
final class ReportBody {
  const ReportBody({
    this.startDate,
    this.endDate,
    this.policyType,
    this.policyStatus,
    this.dateRange,
    this.paymentSystem,
  });

  factory ReportBody.fromJson(Map<String, dynamic> json) => _$ReportBodyFromJson(json);

  Map<String, dynamic> toJson() => _$ReportBodyToJson(this);

  final DateTime? startDate;
  final DateTime? endDate;
  final String? policyType;
  final String? policyStatus;
  final String? dateRange;
  final String? paymentSystem;

  ReportParam toParam() {
    return ReportParam(
      startDate: startDate,
      endDate: endDate,
      policyType: policyType,
      policyStatus: policyStatus,
    );
  }
}

@JsonEnum()
enum PolicyStatus {
  @JsonValue('ACTIVE')
  active,
  @JsonValue('UNPAID')
  unPaid,
  @JsonValue('EXPIRED')
  expired,
}