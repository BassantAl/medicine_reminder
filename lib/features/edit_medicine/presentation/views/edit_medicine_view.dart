import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medicine_reminder/core/routes/app_routes.dart';
import 'package:medicine_reminder/features/edit_medicine/presentation/views/widgets/edit_medicine_view_body.dart';
import 'package:medicine_reminder/features/home/data/models/home_medicines_model.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class EditMedicineView extends StatelessWidget {
  const EditMedicineView({super.key, required this.homeMedicineModel});
  final HomeMedicineModel homeMedicineModel;
  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(localization.EditMedicine),
        leading: InkWell(
          onTap: () {
            context.go(AppRoutes.homeView);
          },
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: EditMedicineViewBody(homeMedicineModel: homeMedicineModel),
    );
  }
}


//  BlocProvider(create: (context) => getIt<UpdateMedicineCubit>()),