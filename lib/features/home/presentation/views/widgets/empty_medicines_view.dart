import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/theme/app_styles.dart';
import 'package:medicine_reminder/features/home/presentation/views/widgets/empty_medicines_illustration.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class EmptyMedicinesView extends StatelessWidget {
  const EmptyMedicinesView({super.key, required this.onAddMedicine});

  final VoidCallback onAddMedicine;

  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);

    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              EmptyMedicinesIllustration(),
              const SizedBox(height: 28),

              // Title
              Text(
                localization.noMedicinesYet,
                textAlign: TextAlign.center,
                style: AppStyles.bold24(context: context),
                ),
              

              const SizedBox(height: 12),

              // Description
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 320),
                child: Text(
                  localization.noMedicinesYetDescription,
                  textAlign: TextAlign.center,
                  style: AppStyles.regular14(context: context)
                ),
              ),

              const SizedBox(height: 28),
            ],
          ),
        ),
      ),
    );
  }
}
