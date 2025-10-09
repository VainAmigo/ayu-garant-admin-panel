part of 'accounting_cubit.dart';

@immutable
sealed class AccountingState {
  const AccountingState();
}

@immutable
final class AccountingInitial extends AccountingState {
  const AccountingInitial();
}

@immutable
final class AccountingLoading extends AccountingState {
  const AccountingLoading();
}

@immutable
final class AccountingSuccess extends AccountingState {
  const AccountingSuccess(this.entity);

  final List<ReportEntity> entity;
}

@immutable
final class AccountingError extends AccountingState {
  const AccountingError(this.error);

  final dynamic error;
}