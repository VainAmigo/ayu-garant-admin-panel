import 'dart:developer';

import 'package:ayu_admin_panel/services/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'notification_state.dart';

class NotificationCubit extends Cubit<NotificationState> {
  NotificationCubit(this.repository) : super(const NotificationInitial());

  final Repository repository;

  Future<void> getNotificationList({
    required NotificationListParam param,
  }) async {
    try {
      if (state is NotificationLoading) return;
      emit(const NotificationLoading());
      final data = await repository.getNotificationList(param);
      emit(NotificationListSuccess(data));
    } catch (e, s) {
      log('NotificationCubit Error: $e\n$s');
      emit(NotificationError(e));
    }
  }

  Future<void> addNotification({
    required AddNotificationParam param,
  }) async {
    try {
      if (state is NotificationLoading) return;
      emit(const NotificationLoading());
      final data = await repository.addNotification(param);
      emit(AddNotificationSuccess(data));
    } catch (e, s) {
      log('NotificationCubit Error: $e\n$s');
      emit(NotificationError(e));
    }
  }

  Future<void> controlNotification({
    required NotificationControlParam param,
  }) async {
    try {
      if (state is NotificationLoading) return;
      emit(const NotificationLoading());
      final data = await repository.controlNotification(param);
      emit(ControlNotificationSuccess(data));
    } catch (e, s) {
      log('NotificationCubit Error: $e\n$s');
      emit(NotificationError(e));
    }
  }
}