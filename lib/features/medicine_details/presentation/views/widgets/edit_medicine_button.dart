import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medicine_reminder/core/routes/app_routes.dart';
import 'package:medicine_reminder/core/widgets/custom_button.dart';
import 'package:medicine_reminder/features/home/data/models/home_medicines_model.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class EditMedicineButton extends StatelessWidget {
  const EditMedicineButton({super.key, required this.homeMedicineModel});
  final HomeMedicineModel homeMedicineModel;
  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);
    return CustomPrimaryButton(
      showIcon: false,
      text: localization.EditMedicine,
      onPressed: () {
        context.go(AppRoutes.editMedicineView , extra: homeMedicineModel);
      },
    );
  }
}
