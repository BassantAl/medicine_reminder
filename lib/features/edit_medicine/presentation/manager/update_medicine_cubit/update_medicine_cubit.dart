
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:medicine_reminder/core/errors/failure.dart';

import 'package:medicine_reminder/features/add_medicine/data/models/medicine_model.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/does_schedule_model.dart';
import 'package:medicine_reminder/features/add_medicine/data/models/daily_does_model.dart';

import 'package:medicine_reminder/features/home/data/models/home_medicines_model.dart';

import 'package:medicine_reminder/features/edit_medicine/domain/use_cases/update_medicine_use_case.dart';

part 'update_medicine_state.dart';

class UpdateMedicineCubit extends Cubit<UpdateMedicineState> {
  UpdateMedicineCubit({
    required this.updateMedicineUseCase,
  }) : super(UpdateMedicineInitial());

  final UpdateMedicineUseCase updateMedicineUseCase;

  // Medicine Information

  String? medicineName = '';
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

  int? scheduleId;

  void updateFrequency(String value) {
    frequency = value;
  }

  void updateSelectedDays(List<int> value) {
    selectedDays = List<int>.from(value);
    emit(UpdateMedicineFormUpdated());
  }

  void selectEveryDay() {
    selectedDays = List.generate(7, (index) => index);
    emit(UpdateMedicineFormUpdated());
  }

  void updateDoseTimes(List<String> value) {
    doseTimes = List<String>.from(value);
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

  bool sameDoseEveryDay = true;

  void initializeDailyDoses({
    required List<DailyDoesModel> dailyDoses,
  }) {
    dosesByDay = {
      for (final dose in dailyDoses)
        dose.dayOfWeek: dose.doseAmount,
    };

    final uniqueDoses = dosesByDay.values.toSet();

    sameDoseEveryDay = uniqueDoses.length <= 1;
  }

  void updateDoseForDay(int day, double dose) {
    dosesByDay[day] = dose;
  }

  void updateDoseForAllDays(double dose) {
    for (final day in selectedDays) {
      dosesByDay[day] = dose;
    }
  }

  bool hasAtLeastOneDose() {
    return selectedDays.any(
      (day) => (dosesByDay[day] ?? 0) > 0,
    );
  }

  bool validateDailyDoses() {
    for (final day in selectedDays) {
      final dose = dosesByDay[day];

      if (dose == null || dose <= 0) {
        return false;
      }
    }

    return true;
  }

  List<DailyDoesModel> getDailyDoses() {
    return selectedDays
        .where((day) => dosesByDay.containsKey(day))
        .map((day) {
          return DailyDoesModel(
            scheduleId: scheduleId ?? 0,
            dayOfWeek: day,
            doseAmount: dosesByDay[day]!,
          );
        })
        .toList();
  }

  // Initialize Existing Medicine Data

  void initializeMedicine(HomeMedicineModel data) {
    // Medicine
    medicineName = data.medicine.name;
    foodInstruction = data.medicine.foodInstruction;
    notes = data.medicine.notes ?? '';

    // Schedule
    final schedule = data.schedule;

    if (schedule != null) {
      scheduleId = schedule.id;

      frequency = schedule.frequency;
      selectedDays = List<int>.from(schedule.selectedDays);
      doseTimes = List<String>.from(schedule.doseTimes);

      startDate = schedule.startDate;
      endDate = schedule.endDate;

      enableNotifications = schedule.enableNotifications;
    }

    // Daily Doses
    initializeDailyDoses(
      dailyDoses: data.dailyDoses,
    );

    emit(UpdateMedicineFormUpdated());
  }

  // Save Updated Medicine

  Future<void> updateMedicine({
    required int medicineId,
  }) async {
    emit(UpdateMedicineLoading());

    try {
      final medicineModel = MedicineModel(
        id: medicineId,
        name: medicineName,
        foodInstruction: foodInstruction,
        notes: notes,
      );

      final scheduleModel = DoesScheduleModel(
        id: scheduleId,
        medicineId: medicineId,
        frequency: frequency,
        selectedDays: selectedDays,
        doseTimes: doseTimes,
        startDate: startDate,
        endDate: endDate,
        enableNotifications: enableNotifications,
      );

      final result = await updateMedicineUseCase(
        medicineId: medicineId,
        medicine: medicineModel,
        schedule: scheduleModel,
        dailyDoses: getDailyDoses(),
      );

      result.fold(
        (failure) {
          emit(UpdateMedicineFailure(failure));
        },
        (_) {
          emit(UpdateMedicineSuccess());
        },
      );
    } catch (e) {
      emit(
        UpdateMedicineFailure(
          Failure(errorMessage: e.toString()),
        ),
      );
    }
  }
}
