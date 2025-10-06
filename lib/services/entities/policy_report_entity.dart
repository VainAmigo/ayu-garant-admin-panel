import 'package:ayu_admin_panel/services/services.dart';
import 'package:flutter/foundation.dart';

@immutable
final class PolicyReportEntity {
  const PolicyReportEntity({
    required this.policyNumber,
    required this.creationDate,
    required this.startDate,
    required this.endDate,
    required this.policyType,
    required this.policyCost,
    required this.model,
    required this.brand,
    required this.policyHolderName,
    required this.policyStatus,
  });

  final String policyNumber;
  final DateTime creationDate;
  final DateTime startDate;
  final DateTime endDate;
  final String policyType;
  final double policyCost;
  final String model;
  final String brand;
  final String policyHolderName;
  final PolicyStatus policyStatus;

  bool get isActive {
    return policyStatus == PolicyStatus.active;
  }
}

final class PolicyReportParam {
  const PolicyReportParam({
    this.startDate,
    this.endDate,
    this.policyType,
    this.dateRange,
    this.isActive,
  });

  final DateTime? startDate;
  final DateTime? endDate;
  final String? policyType;
  final String? dateRange;
  final bool? isActive;

  PolicyReportParam toBody() {
    return PolicyReportParam(
      startDate: startDate,
      endDate: endDate,
      policyType: policyType,
      dateRange: dateRange,
      isActive: isActive,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'startDate': startDate?.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'policyType': policyType,
      'dateRange': dateRange,
      'isActive': isActive,
    };
  }
}