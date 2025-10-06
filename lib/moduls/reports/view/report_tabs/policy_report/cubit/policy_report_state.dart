part of 'policy_report_cubit.dart';

@immutable
sealed class PolicyReportState {
  const PolicyReportState();
}

@immutable
final class PolicyReportInitial extends PolicyReportState {
  const PolicyReportInitial();
}

@immutable
final class PolicyReportLoading extends PolicyReportState {
  const PolicyReportLoading();
}

@immutable
final class PolicyReportSuccess extends PolicyReportState {
  const PolicyReportSuccess(this.entity);

  final List<PolicyReportEntity> entity;
}

@immutable
final class PolicyReportError extends PolicyReportState {
  const PolicyReportError(e);
}