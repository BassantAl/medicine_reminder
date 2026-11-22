import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/methods/get_does_time_period.dart';
import 'package:medicine_reminder/features/home/data/models/medicine_does_data.dart';
import 'package:medicine_reminder/features/home/presentation/views/widgets/medicines_schedule_body.dart';

class MedicinesScheduleManage extends StatelessWidget {
  const MedicinesScheduleManage({super.key, required this.groupedDoses});
  final Map<DoseTimePeriod, List<MedicineDoseData>> groupedDoses;

  @override
  Widget build(BuildContext context) {
    return MedicinesScheduleBody(groupedDoses: groupedDoses);
  }
}
