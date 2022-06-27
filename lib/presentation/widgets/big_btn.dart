import 'package:flutter/material.dart';
import 'package:ummah/constant/style/Style.dart';
import 'package:ummah/presentation/base/base_widget.dart';

class BigBtn extends BaseStateLessWidget {
  final VoidCallback onTap;
  final Widget child;
  final ButtonStyle? buttonStyle;

   BigBtn({required this.onTap, Key? key, required this.child, this.buttonStyle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      style: buttonStyle ?? Style.of(context).defaultButtonStyle(),
      child: child,
    );
  }
}
