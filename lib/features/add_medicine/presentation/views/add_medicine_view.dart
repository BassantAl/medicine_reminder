import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_reminder/core/di/service_locator.dart';
import 'package:medicine_reminder/features/add_medicine/domain/use_cases/add_medicine_use_case.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/manager/cubit/add_medicine_cubit.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/views/widgets/add_medicine_view_body.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class AddMedicineView extends StatelessWidget {
  const AddMedicineView({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);
    return BlocProvider(
      create: (context) =>
          AddMedicineCubit(addMedicineUseCase: getIt<AddMedicineUseCase>()),
      child: Scaffold(
        appBar: AppBar(title: Text(localization.addMedicine)),
        body: const AddMedicineViewBody(),
      ),
    );
  }
}
