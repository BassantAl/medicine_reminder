import 'package:flutter/material.dart';
import 'package:medicine_reminder/core/theme/app_decoration.dart';

class CustomTextFeild extends StatelessWidget {
  const CustomTextFeild({
    super.key,
    this.controller,
    this.keyboardType,
    this.validator,
    this.maxLines = 1, this.hintText, this.onSaved,
  });

  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final int? maxLines;
  final String? hintText;
  final Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      controller: controller,
      validator: validator,
      keyboardType: keyboardType,
      maxLines: maxLines,
      decoration: AppDecoration.inputDecoration(
        context: context,
        hintText: hintText,
      ),
    );
  }
}
