import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medicine_reminder/core/constants/assets.dart';
import 'package:medicine_reminder/core/di/service_locator.dart';
import 'package:medicine_reminder/core/routes/app_routes.dart';
import 'package:medicine_reminder/features/home/domain/use_cases/get_medicines_use_case.dart';
import 'package:medicine_reminder/features/home/presentation/manager/cubit/get_all_medicines_cubit.dart';
import 'package:medicine_reminder/features/home/presentation/views/widgets/home_view_body.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAllMedicinesCubit(
        getMedicinesUseCase: getIt<GetMedicinesUseCase>(),
      )..getAllMedicines(),
      child: Scaffold(
        appBar: AppBar(
          leading: SvgPicture.asset(Assets.resourceImagesAppIcon),
          centerTitle: false,
          title: Text(S.of(context).appName + S.of(context).appName1),
        ),
        body: HomeViewBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            GoRouter.of(context).push(AppRoutes.addMedicineView);
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
