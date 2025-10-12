
import 'dart:developer';

import 'package:ayu_admin_panel/services/services.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'emergancy_comm_state.dart';

class EmergancyCommCubit extends Cubit<EmergancyCommState> {
  EmergancyCommCubit(this.repository) : super(EmergancyCommInitial());

  final Repository repository;

  Future<void> getAvarSearch({
    required AvarSearchParam param,
  }) async {
    try {
      if (state is EmergancyCommLoading) return;
      emit(const EmergancyCommLoading());
      final data = await repository.getAvarSearch(param);
      emit(EmergancyCommLoaded(data));
    } catch (e, s) {
      log('EmergancyCommCubit Error: $e\n$s');
      emit(EmergancyCommError(e.toString()));
    }
  }
}