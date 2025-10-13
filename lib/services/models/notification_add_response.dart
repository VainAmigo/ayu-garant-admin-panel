import 'package:ayu_admin_panel/services/services.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_add_response.g.dart';

@JsonSerializable()
@immutable
final class AddNotificationResponse {
  const AddNotificationResponse({
    required this.message,
    required this.success,
  });

  factory AddNotificationResponse.fromJson(Map<String, dynamic> json) => _$AddNotificationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddNotificationResponseToJson(this);

  final String message;
  final bool success;

  AddNotificationEntity toEntity() {
    return AddNotificationEntity(
      message: message,
      success: success,
    );
  }
}

@JsonSerializable(explicitToJson: true)
@immutable
final class AddNotificationBody {
  const AddNotificationBody({
    required this.title,
    required this.body,
    required this.type,
    this.date,
    this.time,
    this.weekday,
  });

  factory AddNotificationBody.fromJson(Map<String, dynamic> json) => _$AddNotificationBodyFromJson(json);

  Map<String, dynamic> toJson() => _$AddNotificationBodyToJson(this);

  final String title;
  final String body;
  final NotificationType type;
  final DateTime? date;
  final String? time;
  final DotWeekday? weekday;

  AddNotificationParam toParam() {
    return AddNotificationParam(
      title: title,
      body: body,
      type: type,
      date: date,
      time: time,
      weekday: weekday,
    );
  }
}

@JsonEnum()
enum NotificationType {
  @JsonValue('SINGLE')
  single,
  @JsonValue('WEEKLY')
  weekly,
  @JsonValue('MONTHLY')
  monthly,
}

@JsonEnum()
enum DotWeekday {
  @JsonValue('MONDAY')
  monday,
  @JsonValue('TUESDAY')
  tuesday,
  wednesday,
  @JsonValue('THURSDAY')
  thursday,
  @JsonValue('FRIDAY')
  friday,
  @JsonValue('SATURDAY')
  saturday,
  @JsonValue('SUNDAY')
  sunday,
}