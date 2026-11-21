import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medicine_reminder/core/di/service_locator.dart';
import 'package:medicine_reminder/core/methods/get_does_time_header.dart';
import 'package:medicine_reminder/core/methods/get_does_time_period.dart';
import 'package:medicine_reminder/core/methods/get_next_dose_update.dart';
import 'package:medicine_reminder/core/routes/app_routes.dart';
import 'package:medicine_reminder/features/home/data/models/medicine_does_data.dart';
import 'package:medicine_reminder/features/home/domain/use_cases/manage_does_history_use_case.dart';
import 'package:medicine_reminder/features/home/presentation/manager/manage_does_history_cubit/manage_does_history_cubit.dart';
import 'package:medicine_reminder/features/home/presentation/manager/get_all_medicines_cubit/get_all_medicines_cubit.dart';

import 'package:medicine_reminder/features/home/presentation/views/widgets/medicine_does_card.dart';

class MedicinesScheduleBody extends StatefulWidget {
  const MedicinesScheduleBody({super.key, required this.groupedDoses});

  final Map<DoseTimePeriod, List<MedicineDoseData>> groupedDoses;

  @override
  State<MedicinesScheduleBody> createState() => _MedicinesScheduleBodyState();
}

class _MedicinesScheduleBodyState extends State<MedicinesScheduleBody> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _scheduleNextUpdate();
  }

  @override
  void didUpdateWidget(covariant MedicinesScheduleBody oldWidget) {
    super.didUpdateWidget(oldWidget);
    _scheduleNextUpdate();
  }

  void _scheduleNextUpdate() {
    _timer?.cancel();

    final allDoses = widget.groupedDoses.values
        .expand((doses) => doses)
        .toList();

    final nextUpdate = getNextDoseUpdate(doses: allDoses, now: DateTime.now());

    if (nextUpdate == null) return;

    final duration = nextUpdate.difference(DateTime.now());

    _timer = Timer(duration, () {
      if (!mounted) return;

      setState(() {
        _scheduleNextUpdate();
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ManageDoesHistoryCubit(
        manageDoesHistoryUseCase: getIt<ManageDoesHistoryUseCase>(),
      ),
      child: BlocListener<ManageDoesHistoryCubit, ManageDoesHistoryState>(
        listener: (context, state) {
          if (state is ManageDoesHistorySuccess) {
            context.read<GetAllMedicinesCubit>().getAllMedicines();
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (final period in DoseTimePeriod.values)
                if (widget.groupedDoses[period]!.isNotEmpty) ...[
                  getDoseTimeHeader(period: period, context: context),

                  const SizedBox(height: 5),

                  ...widget.groupedDoses[period]!.map(
                    (dose) => Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: GestureDetector(
                        onTap: () {
                          context.go(AppRoutes.editMedicineView);
                        },
                        child: MedicineDoseCard(
                          medicine: dose.medicine,
                          doseTime: dose.doseTime,
                          dailyDose: dose.dailyDose,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),
                ],
            ],
          ),
        ),
      ),
    );
  }
}
