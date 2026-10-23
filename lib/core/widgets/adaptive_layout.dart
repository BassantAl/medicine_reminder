import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/utils/size_config.dart';

class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout({
    super.key,
    required this.mobileLayout,
    required this.tabletLayout,
  });
  final WidgetBuilder mobileLayout;
  final WidgetBuilder tabletLayout;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxHeight < SizeConfig.maxMobileSize) {
          return mobileLayout(context);
        } else if (constraints.maxHeight > SizeConfig.maxMobileSize &&
            constraints.maxHeight < SizeConfig.maxTabletSize) {
          return tabletLayout(context);
        } else {
          return Scaffold();
        }
      },
    );
  }
}
