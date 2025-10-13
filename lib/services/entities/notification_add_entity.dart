import 'package:ayu_admin_panel/services/services.dart';
import 'package:flutter/material.dart';

@immutable
final class AddNotificationEntity {
  const AddNotificationEntity({
    required this.message,
    required this.success,
  });

  final String message;
  final bool success;
}

@immutable
final class AddNotificationParam {
  const AddNotificationParam({
    required this.title,
    required this.body,
    required this.type,
    this.date,
    this.time,
    this.weekday,
  });

  final String title;
  final String body;
  final NotificationType type;
  final DateTime? date;
  final String? time;
  final DotWeekday? weekday;

  AddNotificationBody toBody() {
    return AddNotificationBody(
      title: title,
      body: body,
      type: type,
      date: date,
      time: time,
      weekday: weekday,
    );
  }
}