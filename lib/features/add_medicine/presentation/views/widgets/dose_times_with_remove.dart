import 'package:flutter/material.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/custom_remove_widget.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/dose_times_widget.dart';

class DoseTimesWithRemove extends StatelessWidget {
  const DoseTimesWithRemove({super.key, this.onTap});
final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(child: InkWell(onTap:onTap , child: CustomRemoveWidget())),
        const Expanded(flex: 4, child: DoseTimesWidget()),
      ],
    );
  }
}
