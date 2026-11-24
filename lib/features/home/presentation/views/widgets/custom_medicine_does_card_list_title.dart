import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/enums/does_status_enum.dart';
import 'package:medicine_reminder/core/theme/app_styles.dart';
import 'package:medicine_reminder/features/home/data/models/home_medicines_model.dart';
import 'package:medicine_reminder/features/home/presentation/views/widgets/custom_list_title_trailing_widget.dart';

class CustomMedicineDoesCardListTitle extends StatelessWidget {
  const CustomMedicineDoesCardListTitle({
    super.key,
    required this.medicine,
    required this.doseTime,
    required this.doseStatus,
  });

  final HomeMedicineModel medicine;
  final String doseTime;
  final DoesStatusEnum doseStatus;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        medicine.medicine.name!,
        style: AppStyles.semiBold16(context: context),
      ),
      subtitle: Text(
        doseTime,
        style: AppStyles.regular16(context: context),
      ),
      trailing: CustomListTitleTrailingWidget(status: doseStatus),
    );
  }
}
