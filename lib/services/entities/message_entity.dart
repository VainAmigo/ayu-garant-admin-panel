import 'package:flutter/foundation.dart';

@immutable
final class MessageEntity {
  const MessageEntity({
    required this.message,
    required this.success,
  });

  final String message;
  final bool success;
}