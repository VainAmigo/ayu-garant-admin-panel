import 'package:ayu_admin_panel/services/services.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'users_report_response.g.dart';

@JsonSerializable()
@immutable
final class UsersReportResponse {
  const UsersReportResponse({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.status,
    required this.roles,
  });

  factory UsersReportResponse.fromJson(Map<String, dynamic> json) => _$UsersReportResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UsersReportResponseToJson(this);

  final String id;
  final String name;
  final String phoneNumber;
  final UsersStatus status;
  final List<UsersRole> roles;

  UsersReportEntity toEntity() {
    return UsersReportEntity(
      id: id,
      name: name,
      phoneNumber: phoneNumber,
      status: status,
      roles: roles,
    );
  }
}

@JsonSerializable(explicitToJson: true)
@immutable
final class UsersReportBody {
  const UsersReportBody({
    this.name,
    this.phoneNumber,
    this.role,
  });

  factory UsersReportBody.fromJson(Map<String, dynamic> json) => _$UsersReportBodyFromJson(json);

  Map<String, dynamic> toJson() => _$UsersReportBodyToJson(this);

  final String? name;
  final String? phoneNumber;
  final String? role;

  UsersReportParam toParam() {
    return UsersReportParam(
      name: name,
      phoneNumber: phoneNumber,
      role: role,
    );
  }
}



@JsonEnum()
enum UsersStatus {
  @JsonValue('ACTIVE')
  active,
  @JsonValue('INACTIVE')
  inactive,
}

@JsonEnum()
enum UsersRole {
  @JsonValue('ADMIN')
  admin,
  @JsonValue('USER')
  user,
  @JsonValue('AVAR_SPECIALIST')
  avarSpecialist,
  @JsonValue('ACCOUNTANT')
  accountant,
}