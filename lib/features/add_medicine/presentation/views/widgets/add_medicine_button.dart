import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/widgets/custom_button.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class AddMedicineButton extends StatelessWidget {
  const AddMedicineButton({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPrimaryButton(
      showIcon: false,
      text: S.of(context).addMedicine,
      onPressed: () {},
    );
  }
}
