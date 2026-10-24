import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medicine_reminder/core/routes/app_routes.dart';
import 'package:medicine_reminder/core/theme/app_styles.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class ManageSkipApperance extends StatelessWidget {
  const ManageSkipApperance({super.key, required this.currentPage});

  final double currentPage;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: currentPage <= 1.5,
      child: Align(
        alignment: Alignment.topRight,
        child: TextButton(
          onPressed: () {
            GoRouter.of(context).pushReplacement(AppRoutes.homeView);
          },
          child: Text(
            S.of(context).skip,
            style: AppStyles.bold14(context: context),
          ),
        ),
      ),
    );
  }
}
