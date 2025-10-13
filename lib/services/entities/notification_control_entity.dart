import 'package:ayu_admin_panel/services/services.dart';
import 'package:flutter/foundation.dart';

@immutable
final class NotificationControlEntity {
  const NotificationControlEntity({
    required this.message,
    required this.success,
  });

  final String message;
  final bool success;
}

@immutable
final class NotificationControlParam {
  const NotificationControlParam({
    required this.id,
    required this.newStatus,
  });

  final String id;
  final NotificationStatus newStatus;

  NotificationControlBody toBody() {
    return NotificationControlBody(
      id: id,
      newStatus: newStatus,
    );
  }
}