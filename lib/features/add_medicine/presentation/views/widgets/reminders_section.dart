import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/manager/cubit/add_medicine_cubit.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/add_medicine_section.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class RemindersSection extends StatefulWidget {
  const RemindersSection({super.key});

  @override
  State<RemindersSection> createState() => _RemindersSectionState();
}

class _RemindersSectionState extends State<RemindersSection> {
  bool enableReminders = true;

  @override
  void initState() {
    super.initState();

    context
        .read<AddMedicineCubit>()
        .updateEnableNotifications(enableReminders);
  }

  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);

    return AddMedicineSection(
      title: localization.reminders,
      icon: Icons.notifications_active_outlined,
      children: [
        ListTile(
          title: Text(localization.enableReminders),
          subtitle: Text(localization.getNotifiedAtEachScheduledDose),
          trailing: Switch(
            value: enableReminders,
            onChanged: (value) {
              setState(() {
                enableReminders = value;
              });

              context
                  .read<AddMedicineCubit>()
                  .updateEnableNotifications(value);
            },
          ),
        ),
      ],
    );
  }
}
