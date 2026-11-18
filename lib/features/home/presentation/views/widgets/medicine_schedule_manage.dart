import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_reminder/core/methods/get_current_day_index.dart';
import 'package:medicine_reminder/core/methods/get_does_time_period.dart';
import 'package:medicine_reminder/features/home/data/models/medicine_does_data.dart';
import 'package:medicine_reminder/features/home/presentation/manager/get_all_medicines_cubit/get_all_medicines_cubit.dart';
import 'package:medicine_reminder/features/home/presentation/views/widgets/medicines_schedule_body.dart';

class MedicinesScheduleManage extends StatelessWidget {
  const MedicinesScheduleManage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllMedicinesCubit, GetAllMedicinesState>(
      builder: (context, state) {
        if (state is GetAllMedicinesSuccess) {
          //  إنشاء قائمة لكل فترة
          final Map<DoseTimePeriod, List<MedicineDoseData>> groupedDoses = {
            for (final period in DoseTimePeriod.values) period: [],
          };
          //  تجميع الجرعات
          for (final medicine in state.medicines) {
            final schedule = medicine.schedule;

            if (schedule == null) continue;

            final todayDoes = medicine.dailyDoses.where(
              (element) => element.dayOfWeek == getCurrentDayIndex(),
            );

            if (todayDoes.isEmpty) continue;

            final dailyDose = todayDoes.first;

            for (final doesTime in schedule.doseTimes) {
              final period = getDoseTimePeriod(doesTime);

              groupedDoses[period]!.add(
                MedicineDoseData(
                  medicine: medicine,
                  doseTime: doesTime,
                  dailyDose: dailyDose,
                ),
              );
            }
          }
          //  عرض الأقسام
          return MedicinesScheduleBody(groupedDoses: groupedDoses);
        }

        return const SizedBox();
      },
    );
  }
}
