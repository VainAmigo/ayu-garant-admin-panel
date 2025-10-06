import 'package:ayu_admin_panel/services/services.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';


part 'policy_report_response.g.dart';

@JsonSerializable()
@immutable
final class PolicyReportResponse {
  const PolicyReportResponse({
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

  factory PolicyReportResponse.fromJson(Map<String, dynamic> json) => _$PolicyReportResponseFromJson(json);
  Map<String, dynamic> toJson() => _$PolicyReportResponseToJson(this);

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

  PolicyReportEntity toEntity() {
    return PolicyReportEntity(
      policyNumber: policyNumber,
      creationDate: creationDate,
      startDate: startDate,
      endDate: endDate,
      policyType: policyType,
      policyCost: policyCost,
      model: model,
      brand: brand,
      policyHolderName: policyHolderName,
      policyStatus: policyStatus,
    );
  }
}

@JsonSerializable()
@immutable
final class PolicyReportResponseBody {
  const PolicyReportResponseBody({
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

  factory PolicyReportResponseBody.fromJson(Map<String, dynamic> json) => _$PolicyReportResponseBodyFromJson(json);
  Map<String, dynamic> toJson() => _$PolicyReportResponseBodyToJson(this);

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
