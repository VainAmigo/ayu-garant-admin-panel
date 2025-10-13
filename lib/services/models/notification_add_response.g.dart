// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_add_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddNotificationResponse _$AddNotificationResponseFromJson(
  Map<String, dynamic> json,
) => AddNotificationResponse(
  message: json['message'] as String,
  success: json['success'] as bool,
);

Map<String, dynamic> _$AddNotificationResponseToJson(
  AddNotificationResponse instance,
) => <String, dynamic>{
  'message': instance.message,
  'success': instance.success,
};

AddNotificationBody _$AddNotificationBodyFromJson(Map<String, dynamic> json) =>
    AddNotificationBody(
      title: json['title'] as String,
      body: json['body'] as String,
      type: $enumDecode(_$NotificationTypeEnumMap, json['type']),
      date: json['date'] == null
          ? null
          : DateTime.parse(json['date'] as String),
      time: json['time'] as String?,
      weekday: $enumDecodeNullable(_$DotWeekdayEnumMap, json['weekday']),
    );

Map<String, dynamic> _$AddNotificationBodyToJson(
  AddNotificationBody instance,
) => <String, dynamic>{
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
