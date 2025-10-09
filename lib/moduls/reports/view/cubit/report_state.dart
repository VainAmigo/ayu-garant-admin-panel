part of 'report_cubit.dart';

@immutable
sealed class ReportState {
  const ReportState();
}

@immutable
final class ReportInitial extends ReportState {
  const ReportInitial();
}

@immutable
final class ReportLoading extends ReportState {
  const ReportLoading();
}

@immutable
final class ReportSuccess extends ReportState {
  const ReportSuccess(this.entity);

  final List<ReportEntity> entity;
}

@immutable
final class ReportError extends ReportState {
  const ReportError(this.error);

  final dynamic error;
}