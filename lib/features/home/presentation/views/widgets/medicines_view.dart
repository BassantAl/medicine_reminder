import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_reminder/core/methods/get_does_time_period.dart';
import 'package:medicine_reminder/core/theme/app_styles.dart';
import 'package:medicine_reminder/features/home/data/models/medicine_does_data.dart';
import 'package:medicine_reminder/features/home/presentation/manager/get_all_medicines_cubit/get_all_medicines_cubit.dart';
import 'package:medicine_reminder/features/home/presentation/views/widgets/medicines_schedule.dart';
import 'package:medicine_reminder/features/home/presentation/views/widgets/todays_adherence_widget.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class MedicinesView extends StatelessWidget {
  const MedicinesView({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);
    return SingleChildScrollView(
      child: BlocBuilder<GetAllMedicinesCubit, GetAllMedicinesState>(
        builder: (context, state) {
          if (state is GetAllMedicinesSuccess) {
            final Map<DoseTimePeriod, List<MedicineDoseData>> groupedDoses = {
              for (final period in DoseTimePeriod.values) period: [],
            };

            for (final medicine in state.medicines) {
              final schedule = medicine.schedule!;
              final dailyDose = medicine.dailyDoses.first;

              for (final doseTime in schedule.doseTimes) {
                final period = getDoseTimePeriod(doseTime);

                groupedDoses[period]!.add(
                  MedicineDoseData(
                    medicine: medicine,
                    doseTime: doseTime,
                    dailyDose: dailyDose,
                  ),
                );
              }
            }

            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    localization.todaysMedicines,
                    style: AppStyles.bold20(context: context),
                  ),
                  const SizedBox(height: 20),
                  TodaysAdherenceWidget(groupedDoses: groupedDoses),
                  const SizedBox(height: 20),
                   MedicinesSchedule(groupedDoses:groupedDoses ,),
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
