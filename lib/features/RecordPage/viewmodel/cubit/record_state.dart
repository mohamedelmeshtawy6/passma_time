part of 'record_cubit.dart';

@immutable
sealed class RecordState {}

final class RecordInitial extends RecordState {}


final class RecordSucces extends RecordState {

final UserRecordModel userRecordModel;

  RecordSucces({required this.userRecordModel});
}



final class RecordFaile extends RecordState {

final String  error;

  RecordFaile({required this.error});
}

