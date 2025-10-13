import 'package:ayu_admin_panel/services/services.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_list_response.g.dart';

@JsonSerializable()
@immutable
final class NotificationListResponse {
  const NotificationListResponse({
    required this.id,
    required this.title,
    required this.body,
    required this.type,
    this.date,
    this.time,
    this.weekday,
  });

  factory NotificationListResponse.fromJson(Map<String, dynamic> json) =>
      _$NotificationListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationListResponseToJson(this);

  final String id;
  final String title;
  final String body;
  final NotificationType type;
  final DateTime? date;
  final String? time;
  final DotWeekday? weekday;

  NotificationListEntity toEntity() {
    return NotificationListEntity(
      id: id,
      title: title,
      body: body,
      type: type,
      date: date,
      time: time,
      weekday: weekday,
      status: NotificationStatus.active,
    );
  }
}

@JsonSerializable(explicitToJson: true)
@immutable
final class NotificationListBody {
  const NotificationListBody({required this.id});

  factory NotificationListBody.fromJson(Map<String, dynamic> json) =>
      _$NotificationListBodyFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationListBodyToJson(this);

  final String id;

  NotificationListParam toParam() {
    return NotificationListParam(id: id);
  }
}

@JsonEnum()
enum NotificationStatus {
  @JsonValue('ACTIVE')
  active,
  @JsonValue('PAUSED')
  paused,
  @JsonValue('STOPPED')
  stopped,
}
