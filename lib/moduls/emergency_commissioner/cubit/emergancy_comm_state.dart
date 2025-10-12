part of 'emergancy_comm_cubit.dart';

@immutable
sealed class EmergancyCommState{
  const EmergancyCommState();
}

@immutable
class EmergancyCommInitial extends EmergancyCommState {
  const EmergancyCommInitial();
}

@immutable
class EmergancyCommLoading extends EmergancyCommState {
  const EmergancyCommLoading();
}

@immutable
class EmergancyCommLoaded extends EmergancyCommState {
  const EmergancyCommLoaded(this.data);
  final List<AvarSearchEntity> data;
}

@immutable
class EmergancyCommError extends EmergancyCommState {
  const EmergancyCommError(this.error);
  final String error;
}