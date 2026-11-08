import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medicine_reminder/features/home/presentation/manager/cubit/get_all_medicines_cubit.dart';
import 'package:medicine_reminder/features/home/presentation/views/widgets/empty_medicines_view.dart';
import 'package:medicine_reminder/features/home/presentation/views/widgets/medicines_error_view.dart';
import 'package:medicine_reminder/features/home/presentation/views/widgets/medicines_loading_view.dart';
import 'package:medicine_reminder/features/home/presentation/views/widgets/medicines_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllMedicinesCubit, GetAllMedicinesState>(
      builder: (context, state) {
        if (state is GetAllMedicinesSuccess) {
          if (state.medicines.isNotEmpty) {
            return const MedicinesView();
          } else {
            return const EmptyMedicinesView();
          }
        } else if (state is GetAllMedicinesFailure) {
          return MedicinesErrorView(errorMessage: state.errorMessage);
        } else if (state is GetAllMedicinesLoading) {
          return const MedicinesLoadingView();
        }

        return const SizedBox();
      },
    );
  }
}
