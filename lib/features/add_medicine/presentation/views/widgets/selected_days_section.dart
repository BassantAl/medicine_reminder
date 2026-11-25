
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:medicine_reminder/features/add_medicine/presentation/manager/cubit/add_medicine_cubit.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/custom_radio_list_title.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/manage_active_and_inactive_week_day_widget.dart';
import 'package:medicine_reminder/features/edit_medicine/presentation/manager/update_medicine_cubit/update_medicine_cubit.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class SelectedDaysSection extends StatefulWidget {
  const SelectedDaysSection({
    super.key,
    required this.isEdit,
  });

  final bool isEdit;

  @override
  State<SelectedDaysSection> createState() =>
      _SelectedDaysSectionState();
}

class _SelectedDaysSectionState extends State<SelectedDaysSection> {
   String selectedItem  = 'daily';

  @override
  void initState() {
    super.initState();

    if (widget.isEdit) {
      final selectedDays =
          context.read<UpdateMedicineCubit>().selectedDays;

      selectedItem = selectedDays.length == 7
          ? 'daily'
          : 'custom';
    } else {

      context.read<AddMedicineCubit>().updateSelectedDays(
        List.generate(7, (index) => index),
      );
    }
  }

void _onSelectionChanged(String? value) {
  if (value == null) return;

  setState(() {
    selectedItem = value;
  });

  if (widget.isEdit) {
    final cubit = context.read<UpdateMedicineCubit>();

    if (value == 'daily') {
      cubit.selectEveryDay();
    }else {
    cubit.restoreCustomSelectedDays();
  }

  } else {
    final cubit = context.read<AddMedicineCubit>();

    final days = value == 'daily'
        ? List.generate(7, (index) => index)
        : <int>[];

    cubit.updateSelectedDays(days);
  }
}

  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(localization.selectedDays),
        const SizedBox(height: 5),

        RadioGroup<String>(
          groupValue: selectedItem,
          onChanged: _onSelectionChanged,
          child: Column(
            children: [
              CustomRadioListTitle(
                isSelected: selectedItem == 'daily',
                title: localization.scheduleEveryDay,
                value: 'daily',
              ),

              const SizedBox(height: 12),

              CustomRadioListTitle(
                isSelected: selectedItem == 'custom',
                title: localization.selectedDays,
                value: 'custom',
              ),

              if (selectedItem == 'custom')
                ManageActiveAndInactiveWeekDayWidget(
                  isEdit: widget.isEdit,
                ),
            ],
          ),
        ),
      ],
    );
  }
}
