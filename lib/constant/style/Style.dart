import 'package:flutter/material.dart';
import 'package:ummah/constant/constants.dart';
import 'package:ummah/application/core/extensions/extensions.dart';
import 'package:ummah/di/di.dart';

class Style {
  static const Color primary = Color(0xFF2A357D);
  static const Color scaffoldBackground = Color(0xFFFFF2EB);
  static const Color secondary = Color(0xFF2A357D);
  static const Color accent1 = Color(0xFFF7D606);
  static const Color fontGrey = Color(0xFF939393);
  static const Color fontGrey2 = Color(0xFF828282);
   static const Color textColor = Color(0xFF4B4B4B);
  static const Color hintColor = Color(0xFFC9C9C9);
  static const Color bgLight = Color(0xFFF3F1ED);

  static const Color card1 = Color(0XFFE0EBFF);
  static const Color card2 = Color(0XFFF6E7EA);
  static const Color card3 = Color(0XFFF0FBFF);
  static const Color card4 = Color(0XFFE2EEEC);
  static const Color card5 = Color(0XFFF2F1ED);
  static const Color card6 = Color(0XFFE2F2E8);
  static const Color card7 = Color(0XFFE6E3F6);
  static const Color title1 = Color(0XFF367AF7);
  static const Color title2 = Color(0XFF9A626B);
  static const Color title3 = Color(0XFF5F849E);
  static const Color title4 = Color(0XFF609990);
  static const Color title5 = Color(0XFF7F7458);
  static const Color title6 = Color(0XFF519A6C);
  static const Color title7 = Color(0XFF645E80);
  static const Color white = Colors.white;
  static const Color red = Color(0XFFA72120);
  static const Color lightRed = Color(0XFFFF0000);
  static const Color redOutline = Color(0XFFFE0000);
  static const Color greenOutline = Color(0XFF33B606);
  static const Color orangeOutline = Color(0XFFF87C00);
  static const Color navIconDefaultColor = Color(0XFFBCBCFF);
   static const Color boxColor1 = Color(0XFFFF0000);
   static const Color boxColor2 = Color(0XFF2A357D);
   static const Color boxColor3 = Color(0XFF4B4B4B);

  Style.of(this.context) : _px = inject<Px>();

  ButtonStyle defaultButtonStyle() => ElevatedButton.styleFrom(
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(_px.k10)),
      minimumSize: Size(context.getWidth(0.80), _px.k50),
      textStyle: context.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w400));

  final BuildContext context;
  final Px _px;
}
