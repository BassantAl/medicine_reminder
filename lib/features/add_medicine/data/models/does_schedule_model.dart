import 'dart:convert';

class DoesScheduleModel {
  final int? id;
  final int medicineId;
  final String frequency;
  final List<int> selectedDays;
  final List<String> doseTimes;
  final DateTime startDate;
  final DateTime? endDate;
  final bool enableNotifications;
  DoesScheduleModel({
    this.id,
    required this.medicineId,
    required this.frequency,
    required this.selectedDays,
    required this.doseTimes,
    required this.startDate,
    this.endDate,
    required this.enableNotifications,
  });
  Map<String, Object?> toMap() {
    return {
      'medicineId': medicineId,
      'frequency': frequency,
      'selectedDays': jsonEncode(selectedDays),
      'doseTimes': jsonEncode(doseTimes),
      'startDate': startDate.toIso8601String(),
      'endDate': endDate?.toIso8601String(),
      'enableNotifications': enableNotifications ? 1 : 0,
    };
  }

  factory DoesScheduleModel.fromMap({required Map<String, dynamic> data}) {
    return DoesScheduleModel(
      id: data['scheduleId'] as int,
      medicineId: data['medicineId'] as int,
      frequency: data['frequency'] as String,
      selectedDays: List<int>.from(jsonDecode(data['selectedDays'] as String)),
      doseTimes: List<String>.from(jsonDecode(data['doseTimes'] as String)),
      startDate: DateTime.parse(data['startDate'] as String),
      endDate: data['endDate'] == null
          ? null
          : DateTime.parse(data['endDate'] as String),
      enableNotifications: data['enableNotifications'] == 1,
    );
  }
}
