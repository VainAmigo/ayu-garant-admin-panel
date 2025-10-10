// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_report_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersReportResponse _$UsersReportResponseFromJson(Map<String, dynamic> json) =>
    UsersReportResponse(
      id: json['id'] as String,
      name: json['name'] as String,
      phoneNumber: json['phoneNumber'] as String,
      status: $enumDecode(_$UsersStatusEnumMap, json['status']),
      roles: (json['roles'] as List<dynamic>)
          .map((e) => $enumDecode(_$UsersRoleEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$UsersReportResponseToJson(
  UsersReportResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'phoneNumber': instance.phoneNumber,
  'status': _$UsersStatusEnumMap[instance.status]!,
  'roles': instance.roles.map((e) => _$UsersRoleEnumMap[e]!).toList(),
};

const _$UsersStatusEnumMap = {
  UsersStatus.active: 'ACTIVE',
  UsersStatus.inactive: 'INACTIVE',
};

const _$UsersRoleEnumMap = {
  UsersRole.admin: 'ADMIN',
  UsersRole.user: 'USER',
  UsersRole.avarSpecialist: 'AVAR_SPECIALIST',
  UsersRole.accountant: 'ACCOUNTANT',
};

UsersReportBody _$UsersReportBodyFromJson(Map<String, dynamic> json) =>
    UsersReportBody(
      name: json['name'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      role: json['role'] as String?,
    );

Map<String, dynamic> _$UsersReportBodyToJson(UsersReportBody instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'role': instance.role,
    };
