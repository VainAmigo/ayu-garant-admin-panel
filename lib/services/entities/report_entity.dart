import 'package:ayu_admin_panel/services/services.dart';
import 'package:flutter/foundation.dart';

@immutable
final class ReportEntity {
  const ReportEntity({
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

  bool get isActive {
    return policyStatus == PolicyStatus.active;
  }
}

@immutable
final class ReportParam {
  const ReportParam({
    this.startDate,
    this.endDate,
    this.policyType,
    this.policyStatus,
    this.dateRange,
    this.paymentSystem,
  });

  final DateTime? startDate;
  final DateTime? endDate;
  final String? policyType;
  final String? policyStatus;
  final String? dateRange;
  final String? paymentSystem;

  ReportBody toBody() {
    return ReportBody(
      startDate: startDate,
      endDate: endDate,
      policyType: policyType,
      policyStatus: policyStatus,
    );
  }
}
