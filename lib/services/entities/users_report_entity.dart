import 'package:ayu_admin_panel/services/services.dart';
import 'package:flutter/foundation.dart';

@immutable
final class UsersReportEntity {
  const UsersReportEntity({
    required this.id,
    required this.name,
    required this.phoneNumber,
    required this.status,
    required this.roles,
  });

  final String id;
  final String name;
  final String phoneNumber;
  final UsersStatus status;
  final List<UsersRole> roles;

  bool get isActive {
    return status == UsersStatus.active;
  }
}

@immutable
final class UsersReportParam {
  const UsersReportParam({
      this.name,
      this.phoneNumber,
      this.role,
  });

  final String? name;
  final String? phoneNumber;
  final String? role;

  UsersReportBody toBody() {
    return UsersReportBody(
      name: name,
      phoneNumber: phoneNumber,
      role: role,
    );
  }
}