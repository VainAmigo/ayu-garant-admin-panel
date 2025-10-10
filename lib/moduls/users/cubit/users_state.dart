part of 'users_cubit.dart';

@immutable
abstract class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object?> get props => [];
}

class UsersInitial extends UsersState {
  const UsersInitial();
}

class UsersLoading extends UsersState {
  const UsersLoading();
}

class UsersSuccess extends UsersState {
  const UsersSuccess(this.users);

  final List<UsersReportEntity> users;

  @override
  List<Object?> get props => [users];
}

class UsersError extends UsersState {
  const UsersError(this.error);

  final Object error;

  @override
  List<Object?> get props => [error];
}
