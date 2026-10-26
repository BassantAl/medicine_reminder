import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/theme/app_decoration.dart';

class CustomDropDownButtonFormFeild<T> extends StatelessWidget {
  const CustomDropDownButtonFormFeild({
    super.key,
    this.items,
    this.onChanged,
    this.initialValue,
  });

  final List<DropdownMenuItem<T>>? items;
  final ValueChanged<T?>? onChanged;
  final T? initialValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<T>(
      initialValue: initialValue,
      items: items,
      onChanged: onChanged,
      decoration: AppDecoration.inputDecoration(context: context),
    );
  }
}
