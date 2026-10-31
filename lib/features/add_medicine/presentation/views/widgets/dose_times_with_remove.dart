import 'package:flutter/material.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/custom_remove_widget.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/dose_times_widget.dart';

class DoseTimesWithRemove extends StatelessWidget {
  const DoseTimesWithRemove({
    super.key,
    required this.index,
    this.onTap,
  });

  final int index;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: onTap,
            child: const CustomRemoveWidget(),
          ),
        ),
        Expanded(
          flex: 4,
          child: DoseTimesWidget(index: index),
        ),
      ],
    );
  }
}