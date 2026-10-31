import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/manager/cubit/add_medicine_cubit.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/add_medicine_section.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/custom_text_feild.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class AdditionalNotesSection extends StatelessWidget {
  const AdditionalNotesSection({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);

    return AddMedicineSection(
      title: localization.additionalNotes,
      icon: Icons.notes_outlined,
      children: [
        CustomTextFeild(
          onSaved: (value) {
            context
                .read<AddMedicineCubit>()
                .updateNotes(value?.trim() ?? '');
          },
          hintText: localization.addInstructionsOrNotesOptional,
          maxLines: 3,
        ),
      ],
    );
  }
}