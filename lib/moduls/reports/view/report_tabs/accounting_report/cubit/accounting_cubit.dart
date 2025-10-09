import 'dart:developer';

import 'package:ayu_admin_panel/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'accounting_state.dart';

class AccountingCubit extends Cubit<AccountingState> {
  AccountingCubit(this.repository) : super(const AccountingInitial());

  final Repository repository;

  Future<void> getAccounting({
    required AccountingParam param,
  }) async {
    try {
      if (state is AccountingLoading) return;
      emit(const AccountingLoading());
      final data = await repository.getAccountingReport(param);
      emit(AccountingSuccess(data));
    } catch (e, s) {
      log('Policy report Error: $e\n$s');
      emit(AccountingError(e));
    }
  }
}
