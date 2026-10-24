import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medicine_reminder/core/routes/app_routes.dart';
import 'package:medicine_reminder/core/widgets/custom_button.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class ManageButtonsApperance extends StatelessWidget {
  const ManageButtonsApperance({
    super.key,
    required this.cureentIndex,
    required this.pageController,
  });
  final int cureentIndex;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    if (cureentIndex == 0) {
      return CustomPrimaryButton(
        text: S.of(context).next,
        onPressed: () {
          navigateToNextView();
        },
        showIcon: false,
      );
    } else if (cureentIndex == 1) {
      return Row(
        children: [
          Expanded(
            child: CustomPrimaryButton(
              text: S.of(context).next,
              onPressed: () {
                navigateToNextView();
              },
              showIcon: false,
            ),
          ),
          SizedBox(width: 8),
          Expanded(
            child: CustomPrimaryButton(
              text: S.of(context).back,
              onPressed: () {
                navigateToPreviousView();
              },
              showIcon: false,
            ),
          ),
        ],
      );
    } else {
      return CustomPrimaryButton(
        text: S.of(context).getStarted,
        showIcon: false,
        onPressed: () {
          navigateToHomeView(context);
        },
      );
    }
  }

  void navigateToNextView() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  void navigateToPreviousView() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.linear,
    );
  }

  void navigateToHomeView(BuildContext context) {
    GoRouter.of(context).pushReplacement(AppRoutes.homeView);
  }
}
