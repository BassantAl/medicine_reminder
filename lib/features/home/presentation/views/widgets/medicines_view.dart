import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/theme/app_styles.dart';
import 'package:medicine_reminder/features/home/presentation/views/widgets/todays_adherence_widget.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class MedicinesView extends StatelessWidget {
  const MedicinesView({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              localization.todaysMedicines,
              style: AppStyles.bold20(context: context),
            ),
            const SizedBox(height: 20),
            const TodaysAdherenceWidget()
          ],
        ),
      ),
    );
  }
}
