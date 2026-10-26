import 'package:flutter/material.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/add_medicine_view_body.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class AddMedicineView extends StatelessWidget {
  const AddMedicineView({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(localization.addMedicine)),
      body: const AddMedicineViewBody(),
    );
  }
}
