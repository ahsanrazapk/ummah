import 'package:flutter/material.dart';

extension SizeExt on double {
  SizedBox verticalBoxPadding() => SizedBox(height: this);
  SizedBox horizontalBoxPadding() => SizedBox(width: this);
}

class Px {
  final double kDefaultDuration = .25;
  static const toolBar = 80.0;
  static const statusBarSize = 35.0;
  final extendSizeBodyBehindAppBar = toolBar + statusBarSize;
  final kDefault = 0.0;
  final k4 = 4.0;
  final k5 = 5.0;
  final k7 = 7.0;
  final k8 = 8.0;
  final k10 = 10.0;
  final k12 = 12.0;
  final k15 = 15.0;
  final k18 = 18.0;
  final k20 = 20.0;
  final k25 = 25.0;
  final k36 = 36.0;
  final k40 = 40.0;
  final k47 = 47.0;
  final k50 = 50.0;
  final k60 = 60.0;
  final k80 = 80.0;
  final k100 = 100.0;
  final k110 = 110.0;
  final k250 = 250.0;
  final k300 = 300.0;
  final k350 = 350.0;
  double get toolBarHeight => toolBar;
}

class Constants {
  static const notAvailable = 'N/A';
  static String? months(int value) {
    switch (value) {
      case 1:
        return "JANUARY";
      case 2:
        return "FEBRUARY";
      case 3:
        return "MARCH";
      case 4:
        return "APRIL";
      case 5:
        return "MAY";
      case 6:
        return "JUNE";
      case 7:
        return "JULY";
      case 8:
        return "AUGUST";
      case 9:
        return "SEPTEMBER";
      case 10:
        return "OCTOBER";
      case 11:
        return "NOVEMBER";
      case 12:
        return "DECEMBER";
      default:
        return null;
    }
  }


}