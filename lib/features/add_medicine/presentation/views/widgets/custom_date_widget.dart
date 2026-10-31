import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:medicine_reminder/core/theme/app_decoration.dart';
import 'package:medicine_reminder/core/theme/app_styles.dart';
import 'package:medicine_reminder/features/add_medicine/presentation/manager/cubit/add_medicine_cubit.dart';

class CustomDateWidget extends StatefulWidget {
  const CustomDateWidget({
    super.key,
    required this.title,
    required this.isStartDate,
    this.initialDate,
  });

  final String title;
  final bool isStartDate;
  final DateTime? initialDate;

  @override
  State<CustomDateWidget> createState() => _CustomDateWidgetState();
}

class _CustomDateWidgetState extends State<CustomDateWidget> {
  late DateTime selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate ?? DateTime.now();
  }

  Future<void> selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (pickedDate == null || !mounted) return;

    setState(() {
      selectedDate = pickedDate;
    });

    final cubit = context.read<AddMedicineCubit>();

    if (widget.isStartDate) {
      cubit.updateStartDate(pickedDate);
    } else {
      cubit.updateEndDate(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppDecoration.boxDecoration(context: context),
      child: ListTile(
        onTap: selectDate,
        leading: Icon(
          Icons.calendar_today_outlined,
          color: Theme.of(context).colorScheme.primary,
        ),
        title: Text(
          widget.title,
          style: AppStyles.regular16(context: context),
        ),
        subtitle: Text(
          DateFormat.yMMMd(
            Localizations.localeOf(context).languageCode,
          ).format(selectedDate),
        ),
      ),
    );
  }
}