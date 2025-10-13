import 'package:ayu_admin_panel/services/services.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'notification_control_response.g.dart';

@JsonSerializable()
@immutable
final class NotificationControlResponse {
  const NotificationControlResponse({
    required this.message,
    required this.success,
  });

  factory NotificationControlResponse.fromJson(Map<String, dynamic> json) => _$NotificationControlResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationControlResponseToJson(this);

  final String message;
  final bool success;

  NotificationControlEntity toEntity() {
    return NotificationControlEntity(
      message: message,
      success: success,
    );
  }
}

@JsonSerializable(explicitToJson: true)
@immutable
final class NotificationControlBody {
  const NotificationControlBody({
    required this.id,
    required this.newStatus,
  });

  factory NotificationControlBody.fromJson(Map<String, dynamic> json) => _$NotificationControlBodyFromJson(json);

  Map<String, dynamic> toJson() => _$NotificationControlBodyToJson(this);

  final String id;
  final NotificationStatus newStatus;

  NotificationControlParam toParam() {
    return NotificationControlParam(
      id: id,
      newStatus: newStatus,
    );
  }
}