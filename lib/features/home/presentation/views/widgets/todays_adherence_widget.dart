import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/theme/app_styles.dart';
import 'package:medicine_reminder/features/home/presentation/views/widgets/circular_adherence_indicator.dart';
import 'package:medicine_reminder/features/home/presentation/views/widgets/dose_status_counts.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class TodaysAdherenceWidget extends StatelessWidget {
  const TodaysAdherenceWidget({super.key});

  @override
  Widget build(BuildContext context) {
        final localization = S.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(
              localization.todaysAdherence,
              style: AppStyles.semiBold18(context: context),
            ),
            subtitle: Text(
              localization.dosesTaken(5, 6),
              style: AppStyles.regular14(context: context),
            ),
            trailing: CircularAdherenceIndicator(percentage: (4 / 6) * 100),
          ),
          const SizedBox(height: 10),
          DoseStatusCounts(taken: 4, pending: 1, missed: 1),
        ],
      ),
    );
  }
}
