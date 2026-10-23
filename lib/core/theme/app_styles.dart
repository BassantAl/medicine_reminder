import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/utils/size_config.dart';

abstract class AppStyles {
  static TextStyle extraBold30({required BuildContext context, Color? color,}) {
    return Theme.of(context).textTheme.headlineLarge!.copyWith(
      color: color,
      fontSize: getResponsiveFontsize(context: context, fontSize: 30),
      fontWeight: FontWeight.w800,
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
