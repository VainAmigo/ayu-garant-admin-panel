import 'dart:async';
import 'dart:developer';

import 'package:ayu_admin_panel/core/core.dart';
import 'package:ayu_admin_panel/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'analytic_event.dart';
part 'analytic_state.dart';

class AnalyticBloc extends Bloc<AnalyticEvent, AnalyticState> {
  AnalyticBloc(this.repository) : super(const AnalyticState()) {
    on<SetFilterData>(_onSetFilterData);
    on<GetAnalyticEvent>(_onGetAnalytic);
    on<InitAnalyticEvent>(_onInitAnalytic);
  }

  final Repository repository;

  void _onSetFilterData(
    SetFilterData event,
    Emitter<AnalyticState> emit,
  ) {
    final newPrepareState = state.prepareState.copyWith(
      startDate: event.startDate,
      endDate: event.endDate,
      dateRange: event.dateRange,
      policyType: event.policyType,
    );
    emit(state.copyWith(prepareState: newPrepareState));
  }

  FutureOr<void> _onInitAnalytic(
    InitAnalyticEvent event,
    Emitter<AnalyticState> emit,
  ) async {
    try {
      final creationState = state.creationState;
      if (creationState is AnalyticCreationLoading) return;
      emit(state.copyWith(creationState: const AnalyticCreationLoading()));
      
      final defaultParam = AnalyticParam(
        platformType: null,
        startDate: DateTime.now().subtract(const Duration(days: 30)),
        endDate: DateTime.now(),
        dateRange: 'month',
      );
      
      final data = await repository.getAnalytic(defaultParam);
      emit(state.copyWith(creationState: AnalyticCreationSuccess(data)));
    } catch (e, s) {
      log('_onInitAnalytic Error: $e\n$s');
      emit(state.copyWith(creationState: AnalyticCreationError(e)));
    }
  }

  FutureOr<void> _onGetAnalytic(
    GetAnalyticEvent event,
    Emitter<AnalyticState> emit,
  ) async {
    try {
      final creationState = state.creationState;
      if (creationState is AnalyticCreationLoading) return;
      emit(state.copyWith(creationState: const AnalyticCreationLoading()));
      final data = await repository.getAnalytic(event.param);
      emit(state.copyWith(creationState: AnalyticCreationSuccess(data)));
    } catch (e, s) {
      log('_onCrPolisCreationEvent Error: $e\n$s');
      emit(state.copyWith(creationState: AnalyticCreationError(e)));
    }
  }
}
