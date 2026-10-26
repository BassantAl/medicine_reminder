import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/theme/medicine_status_colors.dart';

class CustomRemoveWidget extends StatelessWidget {
  const CustomRemoveWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: theme.extension<MedicineStatusColors>()!.missed,
          width: 1,
        ),
      ),
      child: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.surface,

        radius: 14,
        child: Icon(
          Icons.remove,
          color: theme.extension<MedicineStatusColors>()!.missed,
        ),
      ),
    );
  }
}
