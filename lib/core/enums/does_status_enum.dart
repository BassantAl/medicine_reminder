import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/theme/medicine_status_colors.dart';
import 'package:medicine_reminder/generated/l10n.dart';

enum DoesStatusEnum {
  taken,
  pending,
  missed,
  skipped,
  upcoming,
}

extension DoesStatusEnumExtension on DoesStatusEnum {
  String localizedName({required BuildContext context}) {
    final localization = S.of(context);

    switch (this) {
      case DoesStatusEnum.taken:
        return localization.taken;

      case DoesStatusEnum.pending:
        return localization.pending;

      case DoesStatusEnum.missed:
        return localization.missed;

      case DoesStatusEnum.skipped:
        return localization.skip;

      case DoesStatusEnum.upcoming:
        return localization.upcoming;
    }
  }

  Color color({required BuildContext context}) {
    final colors = Theme.of(context)
        .extension<MedicineStatusColors>()!;

    switch (this) {
      case DoesStatusEnum.taken:
        return colors.taken;

      case DoesStatusEnum.pending:
        return colors.pending;

      case DoesStatusEnum.missed:
        return colors.missed;

      case DoesStatusEnum.skipped:
        return colors.skipped;

      case DoesStatusEnum.upcoming:
        return Theme.of(context).colorScheme.secondary ;
    }
  }
}