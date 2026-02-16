part of 'add_data_cubit.dart';

@immutable
sealed class AddDataState {}

final class AddDataInitial extends AddDataState {}

final class Dataloading extends AddDataState {}

final class DataError extends AddDataState {
  final String error;

  DataError(this.error);
}

final class Dataloaded extends AddDataState {}
