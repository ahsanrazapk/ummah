import 'package:flutter/material.dart';
import 'package:ummah/constant/style/Style.dart';
import 'package:ummah/application/core/extensions/extensions.dart';
import 'package:ummah/presentation/base/base_widget.dart';

typedef ValueChanged<T> = void Function(T value);
typedef FormFieldValidator<T> = String? Function(T? value);

class SectionTextField extends BaseStateLessWidget {
  final String hintText;
  final bool obscureText;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;

   SectionTextField(
      {required this.hintText, this.obscureText = false, required this.controller, this.onChanged, this.validator,Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Style.hintColor,
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      validator: validator,
      style: context.textTheme.titleLarge?.copyWith(color: Style.hintColor,fontWeight: FontWeight.w400),
      decoration: InputDecoration(
        focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Style.hintColor)),
        enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Style.hintColor)),
        disabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Style.hintColor)),
        label: Text(
          hintText,
          style: context.textTheme.labelLarge?.copyWith(color: Style.hintColor),
        ),
      ),
    );
  }
}
