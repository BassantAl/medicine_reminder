import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_reminder/core/methods/is_arabic.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/manager/cubit/add_medicine_cubit.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/custom_week_day_widget.dart';
import 'package:medicine_reminder/features/edit_medicine/presentation/manager/update_medicine_cubit/update_medicine_cubit.dart';
import 'package:medicine_reminder/generated/l10n.dart';

enum WeekDay { saturday, sunday, monday, tuesday, wednesday, thursday, friday }

extension WeekDayExtension on WeekDay {
  String getLocal(BuildContext context) {
    final localization = S.of(context);

    switch (this) {
      case WeekDay.saturday:
        return localization.saturday;
      case WeekDay.sunday:
        return localization.sunday;
      case WeekDay.monday:
        return localization.monday;
      case WeekDay.tuesday:
        return localization.tuesday;
      case WeekDay.wednesday:
        return localization.wednesday;
      case WeekDay.thursday:
        return localization.thursday;
      case WeekDay.friday:
        return localization.friday;
    }
  }
}

class ManageActiveAndInactiveWeekDayWidget extends StatelessWidget {
  const ManageActiveAndInactiveWeekDayWidget({
    super.key,
    required this.isEdit,
  });

  final bool isEdit;

  void _toggleDay(BuildContext context, WeekDay day) {
    final updatedDays = isEdit
        ? List<int>.from(
            context.read<UpdateMedicineCubit>().selectedDays,
          )
        : List<int>.from(
            context.read<AddMedicineCubit>().selectedDays,
          );

    if (updatedDays.contains(day.index)) {
      updatedDays.remove(day.index);
    } else {
      updatedDays.add(day.index);
    }

    if (isEdit) {
      context.read<UpdateMedicineCubit>().updateSelectedDays(updatedDays);
    } else {
      context.read<AddMedicineCubit>().updateSelectedDays(updatedDays);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isEdit) {
      return BlocBuilder<UpdateMedicineCubit, UpdateMedicineState>(
        builder: (context, state) {
          final selectedDays =
              context.read<UpdateMedicineCubit>().selectedDays;

          return _buildWeekDays(context, selectedDays);
        },
      );
    }

    return BlocBuilder<AddMedicineCubit, AddMedicineState>(
      builder: (context, state) {
        final selectedDays = context.read<AddMedicineCubit>().selectedDays;

        return _buildWeekDays(context, selectedDays);
      },
    );
  }

  Widget _buildWeekDays(BuildContext context, List<int> selectedDays) {
    return Wrap(
      children: WeekDay.values.map((day) {
        final isDaySelected = selectedDays.contains(day.index);

        return Padding(
          padding: isArabic(context)
              ? const EdgeInsets.only(left: 8, bottom: 8, top: 12)
              : const EdgeInsets.only(right: 8, bottom: 8, top: 12),
          child: InkWell(
            onTap: () => _toggleDay(context, day),
            child: CustomWeekDayWidget(
              isSelected: isDaySelected,
              title: day.getLocal(context),
            ),
          ),
        );
      }).toList(),
    );
  }
}