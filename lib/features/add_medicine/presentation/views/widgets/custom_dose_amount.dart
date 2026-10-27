import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/theme/app_decoration.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/custom_switch_list_title.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/custom_text_feild.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/daily_dose_fields.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class CustomDoseAmount extends StatefulWidget {
  const CustomDoseAmount({super.key});

  @override
  State<CustomDoseAmount> createState() => _CustomDoseAmountState();
}

class _CustomDoseAmountState extends State<CustomDoseAmount> {
  bool sameDoseEveryDay = true;

  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          localization.doseAmount,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 8),

        const CustomTextFeild(),

        const SizedBox(height: 16),

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

        DailyDoseFields(sameDoseEveryDay: sameDoseEveryDay,),
      ],
    );
  }
}

