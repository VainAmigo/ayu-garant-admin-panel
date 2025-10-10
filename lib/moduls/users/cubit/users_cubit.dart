import 'dart:developer';
import 'package:ayu_admin_panel/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  UsersCubit(this.repository) : super(const UsersInitial());

  final Repository repository;

  Future<void> getUsers({
    required UsersReportParam param,
  }) async {
    try {
      if (state is UsersLoading) return;
      emit(const UsersLoading());
      final data = await repository.getUsers(param);
      emit(UsersSuccess(data));
    } catch (e, s) {
      log('Users report Error: $e\n$s');
      emit(UsersError(e));
    }
  }
}
