import 'package:flutter/material.dart';
import 'package:medicine_reminder/features/home/presentation/views/widgets/does_time_header.dart';
import 'package:medicine_reminder/features/home/presentation/views/widgets/medicine_does_card.dart';
import 'package:medicine_reminder/features/home/presentation/views/widgets/section_header.dart';
import 'package:medicine_reminder/generated/l10n.dart';

enum DoseTimePeriod { morning, afternoon, evening, night }

DoseTimePeriod getDoseTimePeriod(DateTime dateTime) {
  final hour = dateTime.hour;

  if (hour >= 5 && hour < 12) {
    return DoseTimePeriod.morning;
  } else if (hour >= 12 && hour < 17) {
    return DoseTimePeriod.afternoon;
  } else if (hour >= 17 && hour < 21) {
    return DoseTimePeriod.evening;
  } else {
    return DoseTimePeriod.night;
  }
}

class MedicinesSchedule extends StatelessWidget {
  const MedicinesSchedule({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(),
        const SizedBox(height: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DoseTimeHeader(
              title: localization.morning,
              icon: Icons.wb_sunny_outlined,
            ),
            const SizedBox(height: 5),
            MedicineDoseCard(),
            const SizedBox(height: 20),
            DoseTimeHeader(
              title: localization.afternoon,
              icon: Icons.wb_twilight,
            ),
            const SizedBox(height: 5),
            MedicineDoseCard(),
            const SizedBox(height: 20),
            DoseTimeHeader(
              title: localization.evening,
              icon: Icons.nights_stay_outlined,
            ),
            const SizedBox(height: 5),
            MedicineDoseCard(),
            const SizedBox(height: 20),
            DoseTimeHeader(
              title: localization.night,
              icon: Icons.nightlight_round,
            ),
            const SizedBox(height: 5),
            MedicineDoseCard(),
          ],
        ),
      ],
    );
  }
}
