import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:medicine_reminder/core/routes/app_routes.dart';
import 'package:medicine_reminder/features/medicine_details/presentation/manager/cubit/get_medicine_details_cubit.dart';
import 'package:medicine_reminder/features/medicine_details/presentation/views/widgets/medicine_details_body.dart';
import 'package:medicine_reminder/generated/l10n.dart';

class MedicineDetailsView extends StatelessWidget {
  const MedicineDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    final localization = S.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(localization.medicineDetails),
        leading: InkWell(
          onTap: () {
            context.go(AppRoutes.homeView);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: BlocBuilder<GetMedicineDetailsCubit, GetMedicineDetailsState>(
        builder: (context, state) {
          if (state is GetMedicineDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is GetMedicineDetailsSuccess) {
            return MedicineDetailsBody(medicine: state.medicine);
          }

          if (state is GetMedicineDetailsFailure) {
            return Center(child: Text(state.errorMessage));
          }

          if (state is GetMedicineDetailsNotFound) {
            return const Center(child: Text('Medicine not found'));
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
