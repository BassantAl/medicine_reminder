import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/methods/get_current_day_index.dart';
import 'package:medicine_reminder/core/theme/app_decoration.dart';
import 'package:medicine_reminder/core/widgets/custom_dose_amount_text_feild.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/custom_switch_list_title.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/daily_dose_fields.dart';
import 'package:medicine_reminder/features/home/data/models/home_medicines_model.dart';

class CustomDoseAmountForEditMedicine extends StatefulWidget {
  const CustomDoseAmountForEditMedicine({
    super.key,
    required this.homeMedicineModel,
  });
  final HomeMedicineModel homeMedicineModel;
  @override
  State<CustomDoseAmountForEditMedicine> createState() =>
      _CustomDoseAmountForEditMedicineState();
}

class _CustomDoseAmountForEditMedicineState
    extends State<CustomDoseAmountForEditMedicine> {
  bool sameDoseEveryDay = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomDoseAmountTextFeild(
          hintText: getDoseForToday(
            homeMedicineModel: widget.homeMedicineModel,
          ),
        ),
              const SizedBox(height: 15,),
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

        DailyDoseFields(sameDoseEveryDay: sameDoseEveryDay,isEdit: true, hintText: HomeMedicineModel.,),
      ],
    );
  }

  String getDoseForToday({required HomeMedicineModel homeMedicineModel}) {
    return homeMedicineModel.dailyDoses
        .where((dose) => dose.dayOfWeek == getCurrentDayIndex())
        .first
        .doseAmount
        .toString();
  }
}
