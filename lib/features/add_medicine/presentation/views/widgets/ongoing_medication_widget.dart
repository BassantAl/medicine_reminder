import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/manager/cubit/add_medicine_cubit.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/custom_date_widget.dart';
import 'package:medicine_reminder/features/edit_medicine/presentation/manager/update_medicine_cubit/update_medicine_cubit.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class OngoingMedicationWidget extends StatefulWidget {
  const OngoingMedicationWidget({super.key, required this.isEdit});

  final bool isEdit;

  @override
  State<OngoingMedicationWidget> createState() =>
      _OngoingMedicationWidgetState();
}

class _OngoingMedicationWidgetState extends State<OngoingMedicationWidget> {
  late bool isOngoing;

  @override
  void initState() {
    super.initState();

    if (widget.isEdit) {
      isOngoing = context.read<UpdateMedicineCubit>().endDate == null;
    } else {
      isOngoing = true;
    }
  }

  void _onChanged(bool value) {
    setState(() {
      isOngoing = value;
    });

    if (value && widget.isEdit) {
      context.read<UpdateMedicineCubit>().updateEndDate(null);
    } else if (value && !widget.isEdit) {
      context.read<AddMedicineCubit>().updateEndDate(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(localization.ongoingMedication),
          subtitle: Text(localization.noPlannedEndDate),
          trailing: Switch(value: isOngoing, onChanged: _onChanged),
        ),

        if (!isOngoing)
          CustomDateWidget(
            title: localization.endDate,
            isStartDate: false,
            isEdit: widget.isEdit,
          ),
      ],
    );
  }
}
