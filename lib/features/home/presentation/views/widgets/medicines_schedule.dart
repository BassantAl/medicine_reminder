import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/methods/get_does_time_period.dart';
import 'package:medicine_reminder/features/home/data/models/medicine_does_data.dart';
import 'package:medicine_reminder/features/home/presentation/views/widgets/medicine_schedule_manage.dart';
import 'package:medicine_reminder/features/home/presentation/views/widgets/section_header.dart';


class MedicinesSchedule extends StatelessWidget {
  const MedicinesSchedule({super.key, required this.groupedDoses});

 final Map<DoseTimePeriod, List<MedicineDoseData>> groupedDoses;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(),
        const SizedBox(height: 20),
        MedicinesScheduleManage(groupedDoses: groupedDoses,),
      ],
    );
  }
}

