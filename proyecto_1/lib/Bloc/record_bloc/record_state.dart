part of 'record_bloc.dart';

abstract class RecordState extends Equatable {
  const RecordState();

  @override
  List<Object> get props => [];
}

class RecordInitial extends RecordState {}

class RecordLoading extends RecordState {}

class Recording extends RecordState {}

class RecordError extends RecordState {}
