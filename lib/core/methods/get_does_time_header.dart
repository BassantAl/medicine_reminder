import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/methods/get_does_time_period.dart';
import 'package:medicine_reminder/features/home/presentation/views/widgets/does_time_header.dart';
import 'package:medicine_reminder/generated/l10n.dart';

DoseTimeHeader getDoseTimeHeader({
  required DoseTimePeriod period,
  required BuildContext context,
}) {
  final localization = S.of(context);

  switch (period) {
    case DoseTimePeriod.morning:
      return DoseTimeHeader(
        title: localization.morning,
        icon: Icons.wb_sunny_outlined,
      );

    case DoseTimePeriod.afternoon:
      return DoseTimeHeader(
        title: localization.afternoon,
        icon: Icons.wb_twilight,
      );

    case DoseTimePeriod.evening:
      return DoseTimeHeader(
        title: localization.evening,
        icon: Icons.nights_stay_outlined,
      );

    case DoseTimePeriod.night:
      return DoseTimeHeader(
        title: localization.night,
        icon: Icons.nightlight_round,
      );
  }
}