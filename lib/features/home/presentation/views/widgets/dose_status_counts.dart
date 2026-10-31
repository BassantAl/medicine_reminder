import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/theme/medicine_status_colors.dart';
import 'package:medicine_reminder/features/home/presentation/views/widgets/build_status_item.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class DoseStatusCounts extends StatelessWidget {
  const DoseStatusCounts({
    super.key,
    required this.taken,
    required this.pending,
    required this.missed,
  });

  final int taken;
  final int pending;
  final int missed;

  @override
  Widget build(BuildContext context) {
    final statusColors = Theme.of(context).extension<MedicineStatusColors>()!;

    final localization = S.of(context);

    return Row(
      children: [
        Expanded(
          child: BuildStatusItem(
            count: taken,
            title: localization.taken,
            color: statusColors.taken,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: BuildStatusItem(
            count: pending,
            title: localization.pending,
            color: statusColors.pending,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: BuildStatusItem(
            count: missed,
            title: localization.missed,
            color: statusColors.missed,
          ),
        ),
      ],
    );
  }
}
