import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/methods/is_light.dart';

enum DoseAction { take, skip }

class CustomSkipOrTakeButton extends StatelessWidget {
  final DoseAction action;
  final VoidCallback onPressed;

  const CustomSkipOrTakeButton({
    super.key,
    required this.action,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    final isTake = action == DoseAction.take;

    final color = isTake ? theme.primary : theme.secondary;

    return SizedBox(
      height: 44,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isTake ? color : color.withValues(alpha: 0.12),
          foregroundColor: isTake
              ? isLight(context)
                    ? Colors.white
                    : Colors.black
              : color,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isTake ? Icons.check_circle_outline : Icons.skip_next,
              size: 18,
            ),
            const SizedBox(width: 8),
            Text(
              isTake ? 'Take' : 'Skip',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
