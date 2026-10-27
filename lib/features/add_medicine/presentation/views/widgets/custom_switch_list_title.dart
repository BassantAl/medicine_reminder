import 'package:flutter/material.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class CustomSwitchListTitle extends StatelessWidget {
  const CustomSwitchListTitle({super.key, this.onChanged, required this.sameDoseEveryDay});
  final void Function(bool)? onChanged;
  final bool sameDoseEveryDay;
  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);
    final colors = Theme.of(context).colorScheme;
    return SwitchListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      secondary: Icon(Icons.medication_outlined, color: colors.primary),
      title: Text(
        localization.sameDoseEveryDay,
        style: Theme.of(context).textTheme.titleSmall,
      ),
      subtitle: Text(
        sameDoseEveryDay
            ? localization.sameDoseDescription
            : localization.differentDoseDescription,
        style: Theme.of(
          context,
        ).textTheme.bodySmall?.copyWith(color: colors.onSurfaceVariant),
      ),
      value: sameDoseEveryDay,
      activeTrackColor: colors.primary,
      onChanged: onChanged,
    );
  }
}
