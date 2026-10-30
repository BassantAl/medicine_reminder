part of 'add_medicine_cubit.dart';

@immutable
sealed class AddMedicineState {}

final class AddMedicineInitial extends AddMedicineState {}

class AddMedicineLoading extends AddMedicineState {}

class AddMedicineSuccess extends AddMedicineState {
  final int medicineId;

  AddMedicineSuccess({required this.medicineId});
}

class AddMedicineFailure extends AddMedicineState {
  final String errorMessage;

  AddMedicineFailure({required this.errorMessage});
}
