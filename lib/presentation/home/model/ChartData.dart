import 'package:flutter/material.dart';

class ChartData {
  ChartData(this.x, this.y, [this.color,this.y1]);

  final String x;
  final double y;
  final Color? color;
  final double? y1;
}
