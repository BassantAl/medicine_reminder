import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/methods/is_light.dart';
import 'package:medicine_reminder/core/theme/medicine_status_colors.dart';
import 'package:medicine_reminder/core/utils/size_config.dart';

abstract class AppStyles {
  static TextStyle extraBold30({required BuildContext context, Color? color}) {
    return Theme.of(context).textTheme.headlineLarge!.copyWith(
      color: color,
      fontSize: getResponsiveFontsize(context: context, fontSize: 30),
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle bold14({required BuildContext context}) {
    return Theme.of(context).textTheme.bodySmall!.copyWith(
      fontSize: getResponsiveFontsize(context: context, fontSize: 14),
      fontWeight: FontWeight.bold,
      color: Theme.of(context).extension<MedicineStatusColors>()!.taken,
    );
  }

  static TextStyle regular16({required BuildContext context}) {
    return Theme.of(context).textTheme.bodySmall!.copyWith(
      fontSize: getResponsiveFontsize(context: context, fontSize: 16),
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle bold18({required BuildContext context}) {
    return TextStyle(
      color: isLight(context) ? Colors.white : Colors.black,
      fontSize: getResponsiveFontsize(context: context, fontSize: 18),
      fontWeight: FontWeight.bold,
    );
  }

  static TextStyle bold24({required BuildContext context}) {
    return Theme.of(context).textTheme.headlineLarge!.copyWith(
      fontSize: getResponsiveFontsize(context: context, fontSize: 24),
      fontWeight: FontWeight.bold,
    );
  }

  static double getResponsiveFontsize({
    required int fontSize,
    required BuildContext context,
  }) {
    double scaleFactor = getScaleFactor(context: context);
    double responsiveFontSize = fontSize * scaleFactor;

    double lowerLimit = fontSize * 0.8;
    double upperLimit = fontSize * 1.1;
    return responsiveFontSize.clamp(lowerLimit, upperLimit);
  }

  static double getScaleFactor({required BuildContext context}) {
    double width = MediaQuery.sizeOf(context).width;

    if (width < SizeConfig.maxTabletSize) {
      return width / 500;
    } else {
      return width / 1000;
    }
  }
}
