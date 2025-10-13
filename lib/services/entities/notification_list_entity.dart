import 'package:ayu_admin_panel/services/services.dart';
import 'package:flutter/foundation.dart';

@immutable
final class NotificationListEntity {
  const NotificationListEntity({
    required this.id,
    required this.title,
    required this.body,
    required this.type,
    this.date,
    this.time,
    this.weekday,
    required this.status,
  });

  final String id;
  final String title;
  final String body;
  final NotificationType type;
  final DateTime? date;
  final String? time;
  final DotWeekday? weekday;
  final NotificationStatus status;

  bool get isSingle {
    return type == NotificationType.single;
  }

  bool get isWeekly {
    return type == NotificationType.weekly;
  }

  bool get isMonthly {
    return type == NotificationType.monthly;
  }

  bool get isActive {
    return status == NotificationStatus.active;
  }

  bool get isPaused {
    return status == NotificationStatus.paused;
  }

  bool get isStopped {
    return status == NotificationStatus.stopped;
  }
}

@immutable
final class NotificationListParam {
  const NotificationListParam({
    required this.id,
  });

  final String id;

  NotificationListBody toBody() {
    return NotificationListBody(id: id);
  }
}