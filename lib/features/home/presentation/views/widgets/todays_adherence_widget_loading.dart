import 'package:flutter/material.dart';

class TodaysAdherenceWidgetLoading extends StatelessWidget {
  const TodaysAdherenceWidgetLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
    );
  }
}
