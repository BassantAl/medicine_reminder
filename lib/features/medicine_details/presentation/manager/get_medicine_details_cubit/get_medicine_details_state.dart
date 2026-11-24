part of 'get_medicine_details_cubit.dart';

@immutable
sealed class GetMedicineDetailsState {}

final class GetMedicineDetailsInitial extends GetMedicineDetailsState {}

final class GetMedicineDetailsLoading extends GetMedicineDetailsState {}

final class GetMedicineDetailsSuccess extends GetMedicineDetailsState {
  final HomeMedicineModel medicine;

  GetMedicineDetailsSuccess(this.medicine);
}

final class GetMedicineDetailsNotFound extends GetMedicineDetailsState {}

final class GetMedicineDetailsFailure extends GetMedicineDetailsState {
  final String errorMessage;

  GetMedicineDetailsFailure(this.errorMessage);
}