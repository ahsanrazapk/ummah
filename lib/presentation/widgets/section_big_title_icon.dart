import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:ummah/presentation/base/base_widget.dart';
import 'package:ummah/presentation/widgets/section_horizontal_widget.dart';

class SectionBigTitleWithIcon extends BaseStateLessWidget {
   SectionBigTitleWithIcon(
      {required this.title,
      this.subTitle,
      required this.titleStyle, this.subtitleStyle,
      required this.icon,
        this.gap,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _scale = MediaQuery.maybeOf(context)?.textScaleFactor ?? 1;
    final double? _gap =  gap ?? (_scale <= 1 ? 8 : lerpDouble(8, 4, math.min(_scale - 1, 1)))!;

    return Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisSize: MainAxisSize.min, children: [
      SectionHorizontalWidget(
      firstWidget:  Text(
            title,
            style: titleStyle,
          ),
          secondWidget: icon,
        gap: _gap,
      ),
      subTitle != null ? Text(subTitle!, style: subtitleStyle) : const SizedBox.square(),
    ]);
  }

  final String title;
  final String? subTitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final Widget icon;
  final double? gap;
}
