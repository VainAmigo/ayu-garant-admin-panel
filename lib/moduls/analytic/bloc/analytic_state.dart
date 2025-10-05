part of 'analytic_bloc.dart';

@immutable
final class AnalyticState extends Equatable {
  const AnalyticState({
    this.prepareState = const AnalyticPrepareState(),
    this.creationState = const AnalyticCreationInitial(),
  });

  final AnalyticPrepareState prepareState;
  final AnalyticCreationState creationState;

  @override
  List<Object?> get props => [
        prepareState,
        creationState,
      ];

  AnalyticState copyWith({
    AnalyticPrepareState? prepareState,
    AnalyticCreationState? creationState,
  }) {
    return AnalyticState(
      prepareState: prepareState ?? this.prepareState,
      creationState: creationState ?? this.creationState,
    );
  }

  AnalyticCreationState get getAnalytic => creationState;
}

@immutable
final class AnalyticPrepareState extends Equatable {
  const AnalyticPrepareState({
    this.startDate,
    this.endDate,
    this.dateRange,
    this.policyType,
  });

  final DateTime? startDate;
  final DateTime? endDate;
  final String? dateRange;
  final String? policyType;

  @override
  List<Object?> get props => [
        startDate,
        endDate,
        dateRange,
        policyType,
      ];

  AnalyticPrepareState copyWith({
    DateTime? startDate,
    DateTime? endDate,
    String? dateRange,
    String? policyType,
  }) {
    return AnalyticPrepareState(
      startDate: startDate,
      endDate: endDate,
      dateRange: dateRange,
      policyType: policyType,
    );
  }
}

@immutable
sealed class AnalyticCreationState {
  const AnalyticCreationState();
}

@immutable
final class AnalyticCreationInitial extends AnalyticCreationState {
  const AnalyticCreationInitial();
}

@immutable
final class AnalyticCreationLoading extends AnalyticCreationState {
  const AnalyticCreationLoading();
}

@immutable
final class AnalyticCreationSuccess extends AnalyticCreationState {
  const AnalyticCreationSuccess(this.data);

  final AnalyticEntity data;
}

@immutable
final class AnalyticCreationError extends AnalyticCreationState {
  const AnalyticCreationError(this.error);

  final Object error;

  String? get msj => ErrorParser.parse(error);
}
