import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/widgets/custom_fading_widget.dart';
import 'package:medicine_reminder/features/home/presentation/views/widgets/medicines_schedule_loading.dart';
import 'package:medicine_reminder/features/home/presentation/views/widgets/todays_adherence_widget_loading.dart';

class MedicinesLoadingView extends StatelessWidget {
  const MedicinesLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16),
        child: CustomFadingWidget(
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               SizedBox(height: 20),
               SizedBox(height: 160, child: TodaysAdherenceWidgetLoading()),
               SizedBox(height: 50),
               MedicinesScheduleLoading(),
            ],
          ),
        ),
      ),
    );
  }
}
