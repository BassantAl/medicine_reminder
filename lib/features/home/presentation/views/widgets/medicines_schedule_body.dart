import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/methods/get_does_time_header.dart';
import 'package:medicine_reminder/core/methods/get_does_time_period.dart';
import 'package:medicine_reminder/features/home/data/models/medicine_does_data.dart';
import 'package:medicine_reminder/features/home/presentation/views/widgets/medicine_does_card.dart';

class MedicinesScheduleBody extends StatelessWidget {
  const MedicinesScheduleBody({
    super.key,
    required this.groupedDoses,
  });

  final Map<DoseTimePeriod, List<MedicineDoseData>> groupedDoses;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final period in DoseTimePeriod.values)
            if (groupedDoses[period]!.isNotEmpty) ...[
              getDoseTimeHeader(period: period, context: context),
    
              const SizedBox(height: 5),
    
              ...groupedDoses[period]!.map(
                (dose) => Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: MedicineDoseCard(
                    medicine: dose.medicine,
                    doseTime: dose.doseTime,
                  ),
                ),
              ),
    
              const SizedBox(height: 10),
            ],
        ],
      ),
    );
  }
}
