import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/manager/cubit/add_medicine_cubit.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/custom_text_feild.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/manage_active_and_inactive_week_day_widget.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class DailyDoseItem extends StatelessWidget {
  const DailyDoseItem({
    super.key,
    required this.day,
    required this.sameDoseEveryDay,
  });

  final WeekDay day;
  final bool sameDoseEveryDay;

  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);
    final colors = Theme.of(context).colorScheme;

    return Row(
      children: [
        const SizedBox(width: 8),
        Icon(
          Icons.event_available_outlined,
          size: 20,
          color: colors.primary,
        ),
        const SizedBox(width: 12),

        Expanded(
          child: Text(
            day.getLocal(context),
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        SizedBox(
          width: 110,
          child: CustomTextFeild(
            hintText: localization.Dose,
            keyboardType: const TextInputType.numberWithOptions(
              decimal: true,
            ),
            validator: (value) {
              if (sameDoseEveryDay) return null;

              if (value == null || value.trim().isEmpty) {
                return localization.requiredField;
              }

              final dose = double.tryParse(value.trim());

              if (dose == null || dose <= 0) {
                return localization.invalidDose;
              }

              return null;
            },
            onSaved: (value) {
              if (sameDoseEveryDay) return;

              final dose = double.tryParse(value?.trim() ?? '');

              if (dose == null) return;

              context.read<AddMedicineCubit>().updateDoseForDay(
                day.index,
                dose,
              );
            },
          ),
        ),
      ],
    );
  }
}