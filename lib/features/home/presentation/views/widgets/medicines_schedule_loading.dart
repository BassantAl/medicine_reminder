import 'package:flutter/material.dart';
import 'package:medicine_reminder/features/home/presentation/views/widgets/todays_adherence_widget_loading.dart';

class MedicinesScheduleLoading extends StatelessWidget {
  const MedicinesScheduleLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
         TodaysAdherenceWidgetLoading(),
         SizedBox(height: 20,),
         TodaysAdherenceWidgetLoading(),
         SizedBox(height: 20,),
         TodaysAdherenceWidgetLoading(),
         SizedBox(height: 20,),
         TodaysAdherenceWidgetLoading(),
      ],
    );
  }
}
