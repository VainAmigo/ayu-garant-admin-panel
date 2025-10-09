import 'dart:developer';

import 'package:ayu_admin_panel/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'policy_report_state.dart';

class PolicyReportCubit extends Cubit<PolicyReportState> {
  PolicyReportCubit(this.repository) : super(const PolicyReportInitial());

  final Repository repository;

  Future<void> getPolicyReport({
    required ReportParam param,
  }) async {
    try {
      if (state is PolicyReportLoading) return;
      emit(const PolicyReportLoading());
      final data = await repository.getReport(param);
      emit(PolicyReportSuccess(data));
    } catch (e, s) {
      log('Policy report Error: $e\n$s');
      emit(PolicyReportError(e));
    }
  }
}
