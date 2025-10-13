// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_control_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationControlResponse _$NotificationControlResponseFromJson(
  Map<String, dynamic> json,
) => NotificationControlResponse(
  message: json['message'] as String,
  success: json['success'] as bool,
);

Map<String, dynamic> _$NotificationControlResponseToJson(
  NotificationControlResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'success': instance.success,
};

NotificationControlBody _$NotificationControlBodyFromJson(
  Map<String, dynamic> json,
) => NotificationControlBody(
  id: json['id'] as String,
  newStatus: $enumDecode(_$NotificationStatusEnumMap, json['newStatus']),
);

Map<String, dynamic> _$NotificationControlBodyToJson(
  NotificationControlBody instance,
) => <String, dynamic>{
  'id': instance.id,
  'newStatus': _$NotificationStatusEnumMap[instance.newStatus]!,
};

const _$NotificationStatusEnumMap = {
  NotificationStatus.active: 'ACTIVE',
  NotificationStatus.paused: 'PAUSED',
  NotificationStatus.stopped: 'STOPPED',
};
