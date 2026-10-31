import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/theme/app_styles.dart';

class BuildStatusItem extends StatelessWidget {
  const BuildStatusItem({
    super.key,
    required this.count,
    required this.title,
    required this.color,
  });

  final int count;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            count.toString(),
            style: AppStyles.regular16(context: context, color: color),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: AppStyles.regular14(context: context, color: color),
          ),
        ],
      ),
    );
  }
}
