import 'package:flutter/material.dart';
import 'package:ummah/constant/constants.dart';
import 'package:ummah/constant/style/Style.dart';
import 'package:ummah/application/core/extensions/extensions.dart';
import 'package:ummah/di/di.dart';
import 'package:ummah/presentation/base/base_widget.dart';


class SectionBox extends BaseStateLessWidget {

  final double? width;
  final double? height;
  final Color color;
  final Widget child;
  final bool shadow;
  final bool border;
  final Color? borderColor;
  final double? radius;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry? margin;

  SectionBox({this.width,  this.height, required this.color, required this.child, this.shadow = false, this.border = false, this.borderColor,this.radius ,this.padding = EdgeInsets.zero, this.margin, Key? key}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin ?? EdgeInsets.all(dimens.k5),
      padding: padding,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(radius ?? dimens.k10),
        border: border? Border.all(color: borderColor ?? Style.white, width: 1):null,
        boxShadow: shadow?[
          BoxShadow(
            color:color.withOpacity(0.6),
            blurRadius: 4,
            spreadRadius: 1,
            offset: const Offset(4, 4),
          ),
        ]:null,),
      child: child,
    );
  }
}
