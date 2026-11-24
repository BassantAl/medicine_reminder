
part of 'update_medicine_cubit.dart';

@immutable
sealed class UpdateMedicineState {}

final class UpdateMedicineInitial extends UpdateMedicineState {}

final class UpdateMedicineLoading extends UpdateMedicineState {}

final class UpdateMedicineSuccess extends UpdateMedicineState {}
final class UpdateMedicineFormUpdated extends UpdateMedicineState {}

final class UpdateMedicineFailure extends UpdateMedicineState {
  final Failure failure;

  UpdateMedicineFailure(this.failure);
}
