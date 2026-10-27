import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/theme/app_decoration.dart';
import 'package:medicine_reminder/core/theme/app_styles.dart';
import 'package:intl/intl.dart';

class CustomDateWidget extends StatefulWidget {
  const CustomDateWidget({super.key, required this.title});
  final String title;


  @override
  State<CustomDateWidget> createState() => _CustomDateWidgetState();
}

class _CustomDateWidgetState extends State<CustomDateWidget> {
  DateTime selectedDate = DateTime.now();

  Future<void> selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
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
