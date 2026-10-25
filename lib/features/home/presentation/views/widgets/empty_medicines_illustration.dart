import 'package:flutter/material.dart';

class EmptyMedicinesIllustration extends StatelessWidget {
  const EmptyMedicinesIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      width: 140,
      height: 140,
      decoration: BoxDecoration(
        color: colorScheme.primary.withValues(alpha: 0.10),
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.medication_outlined,
        size: 72,
        color: colorScheme.primary,
      ),
    );
  }
}
