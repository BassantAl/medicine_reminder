import 'dart:convert';

class DoesScheduleModel {
  final int? id;
  final int medicineId;
  final String frequency;
  final List<int> selectedDays;
  final List<String> doseTimes;
  final DateTime startDate;
  final DateTime? endDate;
  DoesScheduleModel({
    this.id,
    required this.medicineId,
    required this.frequency,
    required this.selectedDays,
    required this.doseTimes,
    required this.startDate,
    this.endDate,
  });
  Map<String, Object?> toMap() {
    return {
      'medicineId': medicineId,
      'frequency': frequency,
      'selectedDays': jsonEncode(selectedDays),
      'doseTimes': jsonEncode(doseTimes),
      'startDate': startDate.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
    };
  }
}
