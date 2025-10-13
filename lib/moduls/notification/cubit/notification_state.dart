
part of 'notification_cubit.dart';

@immutable
final class NotificationState {
  const NotificationState();
}

@immutable
final class NotificationInitial extends NotificationState {
  const NotificationInitial();
}

@immutable
final class NotificationLoading extends NotificationState {
  const NotificationLoading();
}

@immutable
final class NotificationListSuccess extends NotificationState {
  const NotificationListSuccess(this.data);

  final List<NotificationListEntity> data;
}

@immutable
final class AddNotificationSuccess extends NotificationState {
  const AddNotificationSuccess(this.data);

  final AddNotificationEntity data;
}

@immutable
final class ControlNotificationSuccess extends NotificationState {
  const ControlNotificationSuccess(this.data);

  final NotificationControlEntity data;
}

@immutable
final class NotificationError extends NotificationState {
  const NotificationError(this.error);

  final Object error;
}