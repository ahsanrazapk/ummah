import 'dart:ui';
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:ummah/constant/constants.dart';
import 'package:ummah/presentation/base/base_widget.dart';

class SectionHorizontalWidget extends BaseStateLessWidget {
 final Widget firstWidget;
 final Widget secondWidget;
 final double? gap;
   SectionHorizontalWidget({Key? key, this.gap, required this.firstWidget, required this.secondWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _scale = MediaQuery.maybeOf(context)?.textScaleFactor ?? 1;
    final double _gap =  gap ?? (_scale <= 1 ? 8 : lerpDouble(8, 4, math.min(_scale - 1, 1)))!;

    return  Row(
      mainAxisSize: MainAxisSize.min,
      children: [firstWidget, _gap.horizontalBoxPadding(), secondWidget
      ],
    );
  }
}

