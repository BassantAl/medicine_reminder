import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:medicine_reminder/features/add_medicine/presentation/manager/cubit/add_medicine_cubit.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/add_medicine_section.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/custom_text_feild.dart';
import 'package:medicine_reminder/features/edit_medicine/presentation/manager/update_medicine_cubit/update_medicine_cubit.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class AdditionalNotesSection extends StatelessWidget {
  const AdditionalNotesSection({
    super.key,
    required this.isEdit,
  });

  final bool isEdit;

  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);

    final initialValue = isEdit
        ? context.read<UpdateMedicineCubit>().notes
        : '';

    return AddMedicineSection(
      title: localization.additionalNotes,
      icon: Icons.notes_outlined,
      children: [
        CustomTextFeild(
          initialValue: initialValue,
          onSaved: (value) {
            final notes = value?.trim() ?? '';

            if (isEdit) {
              context.read<UpdateMedicineCubit>().updateNotes(notes);
            } else {
              context.read<AddMedicineCubit>().updateNotes(notes);
            }
          },
          hintText: localization.addInstructionsOrNotesOptional,
          maxLines: 3,
        ),
      ],
    );
  }
}