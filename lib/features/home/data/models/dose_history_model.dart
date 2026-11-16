import 'package:medicine_reminder/core/enums/does_status_enum.dart';

class DoseHistoryModel {
  final int? id;
  final int dailyDoseId;
  final DateTime scheduledDate;
  final String scheduledTime;
  final DoesStatusEnum status;

  const DoseHistoryModel({
    this.id,
    required this.dailyDoseId,
    required this.scheduledDate,
    required this.scheduledTime,
    this.status = DoesStatusEnum.pending,
  });

  Map<String, dynamic> toMap() {
    return {
      if (id != null) 'id': id,
      'dailyDoseId': dailyDoseId,
      'scheduledDate': scheduledDate.toIso8601String().split('T').first,
      'scheduledTime': scheduledTime,
      'status': status.name,
    };
  }

  factory DoseHistoryModel.fromMap({required Map<String, dynamic> data}) {
    return DoseHistoryModel(
      id: data['id'] as int?,
      dailyDoseId: data['dailyDoseId'] as int,
      scheduledDate: DateTime.parse(data['scheduledDate'] as String),
      scheduledTime: data['scheduledTime'] as String,
      status: data['status'] == null
          ? DoesStatusEnum.pending
          : DoesStatusEnum.values.byName(data['status'] as String),
    );
  }

  DoseHistoryModel copyWith({
    int? id,
    int? dailyDoseId,
    DateTime? scheduledDate,
    String? scheduledTime,
    DoesStatusEnum? status,
  }) {
    return DoseHistoryModel(
      id: id ?? this.id,
      dailyDoseId: dailyDoseId ?? this.dailyDoseId,
      scheduledDate: scheduledDate ?? this.scheduledDate,
      scheduledTime: scheduledTime ?? this.scheduledTime,
      status: status ?? this.status,
    );
  }
}
