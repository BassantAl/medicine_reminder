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

  factory DailyDoesModel.fromMap({
  required Map<String, dynamic> data,
}) {
  return DailyDoesModel(
    id: data['dailyDoseId'] as int?,
    scheduleId: data['scheduleId'] as int,
    dayOfWeek: data['dayOfWeek'] as int,
    doseAmount: (data['doseAmount'] as num).toDouble(),
  );
}
}
