
import 'package:flutter/material.dart';
import 'package:ummah/constant/style/Style.dart';
import 'package:ummah/application/core/extensions/extensions.dart';
import 'package:ummah/presentation/base/base_widget.dart';

typedef ValueChanged<T> = void Function(T value);
typedef FormFieldValidator<T> = String? Function(T? value);

class SectionTextFieldDecor extends BaseStateLessWidget {
  final String? hintText;
  final bool obscureText;
  final bool readOnly;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final GestureTapCallback? onTap;

  SectionTextFieldDecor(
      {this.hintText, this.obscureText = false, this.controller, this.readOnly = false ,this.onChanged, this.validator,this.onTap,Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Style.hintColor,
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      validator: validator,
      readOnly: readOnly,
      onTap: onTap,
      style: context.textTheme.labelLarge?.copyWith(color: Style.textColor,fontWeight: FontWeight.normal),
      decoration: InputDecoration(
          hintText: hintText,
          hintStyle: context.textTheme.labelLarge?.copyWith(color: Style.hintColor,fontWeight: FontWeight.normal),
          isDense: true,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: kOutlineInputBorder(),
          focusedBorder: kOutlineInputBorder(),
          border: kOutlineInputBorder()
      ),
    );
  }

    kOutlineInputBorder() => OutlineInputBorder(
      borderSide:  const BorderSide(color: Style.white), borderRadius: BorderRadius.circular(dimens.k20));
}