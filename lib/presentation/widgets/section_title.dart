import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ummah/presentation/base/base_widget.dart';

class SectionTitle extends BaseStateLessWidget {
   SectionTitle(
      {required this.title, required this.subTitle, required this.titleStyle, required this.subtitleStyle, this.autoResize = false, this.center = false ,Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var main = MainAxisAlignment.start;
    var cross = CrossAxisAlignment.start;
    if(center){
      main = MainAxisAlignment.center;
      cross  = CrossAxisAlignment.center;
    }
    return autoResize ? Column(mainAxisAlignment: main, crossAxisAlignment: cross, children: [
      AutoSizeText(title, style: titleStyle, minFontSize: 10,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    ),
      AutoSizeText(subTitle, style: subtitleStyle,minFontSize: 10,
        maxFontSize: 16,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,),
    ]):Column(mainAxisAlignment: main, crossAxisAlignment: cross, children: [
      Text(title, style: titleStyle),
      Text(subTitle, style: subtitleStyle),
    ]);
  }

  final String title;
  final String subTitle;
  final TextStyle? titleStyle;
  final TextStyle? subtitleStyle;
  final bool autoResize;
  final bool center;
}
