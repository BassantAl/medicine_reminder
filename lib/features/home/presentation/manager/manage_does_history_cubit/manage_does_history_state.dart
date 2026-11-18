part of 'manage_does_history_cubit.dart';

@immutable
sealed class ManageDoesHistoryState {}

final class ManageDoesHistoryInitial extends ManageDoesHistoryState {}

final class ManageDoesHistoryFailure extends ManageDoesHistoryState {
  final String errorMessage;
  ManageDoesHistoryFailure({required this.errorMessage});
}

final class ManageDoesHistoryLoading extends ManageDoesHistoryState {}

final class ManageDoesHistorySuccess extends ManageDoesHistoryState {}
