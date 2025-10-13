// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_list_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationListResponse _$NotificationListResponseFromJson(
  Map<String, dynamic> json,
) => NotificationListResponse(
  id: json['id'] as String,
  title: json['title'] as String,
  body: json['body'] as String,
  type: $enumDecode(_$NotificationTypeEnumMap, json['type']),
  date: json['date'] == null ? null : DateTime.parse(json['date'] as String),
  time: json['time'] as String?,
  weekday: $enumDecodeNullable(_$DotWeekdayEnumMap, json['weekday']),
);

Map<String, dynamic> _$NotificationListResponseToJson(
  NotificationListResponse instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'body': instance.body,
  'type': _$NotificationTypeEnumMap[instance.type]!,
  'date': instance.date?.toIso8601String(),
  'time': instance.time,
  'weekday': _$DotWeekdayEnumMap[instance.weekday],
};

const _$NotificationTypeEnumMap = {
  NotificationType.single: 'SINGLE',
  NotificationType.weekly: 'WEEKLY',
  NotificationType.monthly: 'MONTHLY',
};

const _$DotWeekdayEnumMap = {
  DotWeekday.monday: 'MONDAY',
  DotWeekday.tuesday: 'TUESDAY',
  DotWeekday.wednesday: 'wednesday',
  DotWeekday.thursday: 'THURSDAY',
  DotWeekday.friday: 'FRIDAY',
  DotWeekday.saturday: 'SATURDAY',
  DotWeekday.sunday: 'SUNDAY',
};

NotificationListBody _$NotificationListBodyFromJson(
  Map<String, dynamic> json,
) => NotificationListBody(id: json['id'] as String);

Map<String, dynamic> _$NotificationListBodyToJson(
  NotificationListBody instance,
) => <String, dynamic>{'id': instance.id};
