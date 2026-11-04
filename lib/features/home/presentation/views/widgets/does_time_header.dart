import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/theme/app_styles.dart';

class DoseTimeHeader extends StatelessWidget {
  const DoseTimeHeader({super.key, required this.title, required this.icon});
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 18 ,color:  Theme.of(context).colorScheme.primary),
        const SizedBox(width: 5),

        Text(title, style: AppStyles.semiBold16(context: context,color: Theme.of(context).colorScheme.primary)),
      ],
    );
  }
}
