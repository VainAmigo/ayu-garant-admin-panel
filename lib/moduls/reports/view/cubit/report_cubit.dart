import 'dart:developer';

import 'package:ayu_admin_panel/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'report_state.dart';

class ReportCubit extends Cubit<ReportState> {
  ReportCubit(this.repository) : super(const ReportInitial());

  final Repository repository;

  Future<void> getReport({
    required ReportParam param,
  }) async {
    try {
      if (state is ReportLoading) return;
      emit(const ReportLoading());
      final data = await repository.getReport(param);
      emit(ReportSuccess(data));
    } catch (e, s) {
      log('Policy report Error: $e\n$s');
      emit(ReportError(e));
    }
  }
}
