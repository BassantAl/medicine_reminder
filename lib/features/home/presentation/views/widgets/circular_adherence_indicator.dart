import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/methods/is_light.dart';
import 'package:medicine_reminder/core/theme/app_colors_dark.dart';
import 'package:medicine_reminder/core/theme/app_colors_light.dart';

class CircularAdherenceIndicator extends StatelessWidget {
  const CircularAdherenceIndicator({super.key, required this.percentage});

  final double percentage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 60,
      height: 60,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: CircularProgressIndicator(
              value: percentage / 100,
              strokeWidth: 5,
              backgroundColor:  isLight(context)
                    ? AppColorsLight.adherenceBackground
                    : AppColorsDark.adherenceBackground,
              valueColor: AlwaysStoppedAnimation(
                isLight(context)
                    ? AppColorsLight.adherenceProgress
                    : AppColorsDark.adherenceProgress,
              ),
              strokeCap: StrokeCap.round,
            ),
          ),
          Text(
            '${percentage.toInt()}%',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color:  isLight(context)
                    ? AppColorsLight.adherenceProgress
                    : AppColorsDark.adherenceProgress,
            ),
          ),
        ],
      ),
    );
  }
}
