import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/enums/does_status_enum.dart';
import 'package:medicine_reminder/core/methods/get_does_time_period.dart';
import 'package:medicine_reminder/core/methods/get_status_count.dart';
import 'package:medicine_reminder/core/theme/app_styles.dart';
import 'package:medicine_reminder/features/home/data/models/medicine_does_data.dart';
import 'package:medicine_reminder/features/home/presentation/views/widgets/circular_adherence_indicator.dart';
import 'package:medicine_reminder/features/home/presentation/views/widgets/dose_status_counts.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class TodaysAdherenceWidget extends StatelessWidget {
  const TodaysAdherenceWidget({super.key, required this.groupedDoses});
  final Map<DoseTimePeriod, List<MedicineDoseData>> groupedDoses;
  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);
    final allDoses = groupedDoses.values.expand((doses) => doses).toList();
    final counts = getStatusCounts(allDoses: allDoses);
    final countAllDoses = allDoses.length;
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
              localization.dosesTaken(counts[DoesStatusEnum.taken]!,countAllDoses ),
              style: AppStyles.regular14(context: context),
            ),
            trailing: CircularAdherenceIndicator(
              percentage: ( counts[DoesStatusEnum.taken]!/ countAllDoses) * 100,
            ),
          ),
          const SizedBox(height: 10),
          DoseStatusCounts(
            taken: counts[DoesStatusEnum.taken]!,
            pending: counts[DoesStatusEnum.pending]!,
            missed: counts[DoesStatusEnum.missed]!,
          ),
        ],
      ),
    );
  }
}
