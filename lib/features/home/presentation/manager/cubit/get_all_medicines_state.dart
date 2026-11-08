part of 'get_all_medicines_cubit.dart';

@immutable
sealed class GetAllMedicinesState {}

final class GetAllMedicinesInitial extends GetAllMedicinesState {}

final class GetAllMedicinesLoading extends GetAllMedicinesState {}

final class GetAllMedicinesFailure extends GetAllMedicinesState {
  final String errorMessage;
  GetAllMedicinesFailure({required this.errorMessage});
}

final class GetAllMedicinesSuccess extends GetAllMedicinesState {
  final List<HomeMedicineModel> medicines;
  GetAllMedicinesSuccess({required this.medicines});
}
