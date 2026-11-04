
import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/theme/app_styles.dart';
import 'package:medicine_reminder/features/home/presentation/views/widgets/custom_list_title_trailing_widget.dart';

class MedicineDoseCard extends StatelessWidget {
  const MedicineDoseCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Theme.of(context).dividerColor),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(
              'Vitamin D3 1 Dose',
              style: AppStyles.semiBold16(context: context),
            ),
            subtitle: Text(
              'With water',
              style: AppStyles.regular16(context: context),
            ),
            trailing: const CustomListTitleTrailingWidget(),
          ),
        ],
      ),
    );
  }
}
