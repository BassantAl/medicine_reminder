import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/theme/medicine_status_colors.dart';
import 'package:medicine_reminder/generated/l10n.dart';

enum DoesStatusEnum { taken, pending, missed, skipped, upcoming }

extension DoesStatusEnumExtension on DoesStatusEnum {
  String  name({required BuildContext context}) {
    final loclization = S.of(context);
    switch (this) {
      case DoesStatusEnum.taken:
        return loclization.taken;
      case DoesStatusEnum.pending:
        return loclization.pending;
      case DoesStatusEnum.missed:
        return loclization.missed;
      case DoesStatusEnum.skipped:
        return loclization.skip;
      case DoesStatusEnum.upcoming:
        return loclization.upcoming;
    }
  }

  Color color({required BuildContext context}) {
    final colors = Theme.of(context).extension<MedicineStatusColors>()!;

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
        return colors.pending;
    }
  }
}
