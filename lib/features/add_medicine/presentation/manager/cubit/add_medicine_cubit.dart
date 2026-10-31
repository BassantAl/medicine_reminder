import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/daily_does_model.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/does_schedule_model.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/medicine_model.dart';
import 'package:medicine_reminder/features/add_medicine/domain/use_cases/add_medicine_use_case.dart';
import 'package:meta/meta.dart';

part 'add_medicine_state.dart';

class AddMedicineCubit extends Cubit<AddMedicineState> {
  AddMedicineCubit({required this.addMedicineUseCase})
    : super(AddMedicineInitial());

  final AddMedicineUseCase addMedicineUseCase;

  // Medicine Information
  String medicineName = '';
  String? foodInstruction;
  String notes = '';

  void updateMedicineName(String value) {
    medicineName = value;
  }

  void updateFoodInstruction(String? value) {
    foodInstruction = value;
  }

  void updateNotes(String value) {
    notes = value;
  }

  // Schedule Information
  String frequency = 'onceDaily';
  List<int> selectedDays = [];
  List<String> doseTimes = [];
  DateTime startDate = DateTime.now();
  DateTime? endDate;

  bool enableNotifications = true;

  void updateFrequency(String value) {
    frequency = value;
  }

void updateSelectedDays(List<int> value) {
  selectedDays = List<int>.from(value);
  emit(AddMedicineFormUpdated());
}
void selectEveryDay() {
  selectedDays = List.generate(7, (index) => index);
  emit(AddMedicineFormUpdated());
}


  void updateDoseTimes(List<String> value) {
    doseTimes = value;
  }

  void updateDoseTime(int index, String value) {
  if (index < 0) return;

  if (index >= doseTimes.length) {
    doseTimes.addAll(
      List.filled(index - doseTimes.length + 1, ''),
    );
  }

  doseTimes[index] = value;
}

  void resetDoseTimes(int count) {
  if (count < 0) return;

  if (count < doseTimes.length) {
    doseTimes = doseTimes.take(count).toList();
  } else {
    doseTimes = [
      ...doseTimes,
      ...List.filled(count - doseTimes.length, ''),
    ];
  }
}

 void addDoseTime() {
  doseTimes.add('');
}

void removeDoseTime(int index) {
  if (index < 0 || index >= doseTimes.length) return;
  if (doseTimes.length <= 1) return;

  doseTimes.removeAt(index);
}

  void updateStartDate(DateTime value) {
    startDate = value;
  }

  void updateEndDate(DateTime? value) {
    endDate = value;
  }
  void updateEnableNotifications(bool value) {
  enableNotifications = value;
}

  // Daily Doses
  Map<int, double> dosesByDay = {};

  void updateDoseForDay(int day, double dose) {
    dosesByDay[day] = dose;
  }

  // Save Medicine
  Future<void> addMedicine() async {
    emit(AddMedicineLoading());

    final medicineModel = MedicineModel(
      name: medicineName,
      foodInstruction: foodInstruction,
    );
    log('Selected Days: $selectedDays');

    final doesScheduleModel = DoesScheduleModel(
      medicineId: 0,
      frequency: frequency,
      selectedDays: selectedDays,
      doseTimes: doseTimes,
      startDate: startDate,
      endDate: endDate, enableNotifications: enableNotifications,
    );
    log(
  'Schedule Map: ${doesScheduleModel.toMap()}',
);

    final dailyDoses = dosesByDay.entries.map((entry) {
      return DailyDoesModel(
        scheduleId: 0,
        dayOfWeek: entry.key,
        doseAmount: entry.value,
      );
    }).toList();

    final result = await addMedicineUseCase.addMedicine(
      medicineModel: medicineModel,
      doesScheduleModel: doesScheduleModel,
      dailyDoses: dailyDoses,
    );

    result.fold(
      (failure) {
        emit(AddMedicineFailure(errorMessage: failure.errorMessage));
      },
      (medicineId) {
        emit(AddMedicineSuccess(medicineId: medicineId));
      },
    );
  }
}
