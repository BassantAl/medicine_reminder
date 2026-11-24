import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_reminder/core/theme/app_decoration.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/manager/cubit/add_medicine_cubit.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/custom_switch_list_title.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/custom_text_feild.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/daily_dose_fields.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/manage_active_and_inactive_week_day_widget.dart';
import 'package:medicine_reminder/features/edit_medicine/presentation/manager/update_medicine_cubit/update_medicine_cubit.dart';
import 'package:medicine_reminder/features/home/data/models/home_medicines_model.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class CustomDoseAmount extends StatefulWidget {
  const CustomDoseAmount({
    super.key,
    required this.isEdit,
    this.homeMedicineModel,
  });

  final bool isEdit;
  final HomeMedicineModel? homeMedicineModel;

  @override
  State<CustomDoseAmount> createState() => _CustomDoseAmountState();
}

class _CustomDoseAmountState extends State<CustomDoseAmount> {
  bool sameDoseEveryDay = true;

  double? get initialDose {
    final doses = widget.homeMedicineModel?.dailyDoses ?? [];

    if (doses.isEmpty) return null;

    final firstDose = doses.first.doseAmount;

    final allSameDose = doses.every((dose) => dose.doseAmount == firstDose);

    return allSameDose ? firstDose : null;
  }

  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localization.doseAmount,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 8),

        CustomTextFeild(
          initialValue: widget.isEdit ? initialDose?.toString() : null,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          validator: (value) {
            if (widget.isEdit) return null;

            if (!sameDoseEveryDay) return null;

            if (value == null || value.trim().isEmpty) {
              return localization.pleaseEnterDoseAmount;
            }

            final dose = double.tryParse(value.trim());

            if (dose == null || dose <= 0) {
              return localization.pleaseEnterValidDose;
            }

            return null;
          },
          onSaved: (value) {
            if (!sameDoseEveryDay) return;

            final dose = double.tryParse(value?.trim() ?? '');

            if (dose == null || dose <= 0) return;

            if (widget.isEdit) {
              context.read<UpdateMedicineCubit>().updateDoseForAllDays(dose);
            } else {
              for (final day in WeekDay.values) {
                context.read<AddMedicineCubit>().updateDoseForDay(
                  day.index,
                  dose,
                );
              }
            }
          },
        ),

        const SizedBox(height: 16),

        Container(
          decoration: AppDecoration.boxDecoration(context: context),
          child: CustomSwitchListTitle(
            sameDoseEveryDay: sameDoseEveryDay,
            onChanged: (value) {
              setState(() {
                sameDoseEveryDay = value;
              });
            },
          ),
        ),

        DailyDoseFields(
          sameDoseEveryDay: sameDoseEveryDay,
          isEdit: widget.isEdit,
          dailyDoses: widget.homeMedicineModel?.dailyDoses ?? [],
        ),
      ],
    );
  }
}
