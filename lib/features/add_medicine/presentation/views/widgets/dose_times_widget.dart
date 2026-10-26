import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/theme/app_styles.dart';

class DoseTimesWidget extends StatefulWidget {
  const DoseTimesWidget({super.key});

  @override
  State<DoseTimesWidget> createState() => _DoseTimesWidgetState();
}

class _DoseTimesWidgetState extends State<DoseTimesWidget> {
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _chooseTime() async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: selectedTime 
    );
    if (time == null) return;
    setState(() {
      selectedTime = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        InkWell(
          onTap: _chooseTime,
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              color: theme.colorScheme.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(width: 1, color: theme.colorScheme.primary),
            ),
            child: Row(
              children: [
                SizedBox(width: 12),
                Icon(Icons.schedule, color: theme.colorScheme.primary,size: 20,),
                SizedBox(width: 8),
                Text(selectedTime.format(context),style: AppStyles.regular16(context: context),),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
