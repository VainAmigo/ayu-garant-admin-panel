part of 'analytic_bloc.dart';

@immutable
sealed class AnalyticEvent {
  const AnalyticEvent();
}

@immutable
final class SetFilterData extends AnalyticEvent {
  const SetFilterData({
    required this.startDate,
    required this.endDate,
    required this.dateRange,
    required this.policyType,
  });

  final DateTime? startDate;
  final DateTime? endDate;
  final String? dateRange;
  final String? policyType;
}

@immutable
final class GetAnalyticEvent extends AnalyticEvent {
  const GetAnalyticEvent(this.param);

  final AnalyticParam param;
}

@immutable
final class InitAnalyticEvent extends AnalyticEvent {
  const InitAnalyticEvent();
}