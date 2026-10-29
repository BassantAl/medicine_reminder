class DailyDoesModel {
  final int? id;
  final int scheduleId;
  final int dayOfWeek;
  final double doseAmount;
  DailyDoesModel({
    this.id,
    required this.scheduleId,
    required this.dayOfWeek,
    required this.doseAmount,
  });
  Map<String, Object?> toMap() {
    return {
      'scheduleId': scheduleId,
      'dayOfWeek': dayOfWeek,
      'doseAmount': doseAmount,
    };
  }
}
