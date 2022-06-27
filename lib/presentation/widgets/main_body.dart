import 'package:flutter/material.dart';
import 'package:ummah/constant/constants.dart';
import 'package:ummah/presentation/base/base_widget.dart';

class MainBody extends BaseStateLessWidget {
 final Widget child;
 final bool extendedBottom;
 final bool extendedTop;
 final bool scroll;
 final bool? primary;
 MainBody({Key? key, required this.child, this.extendedBottom = true, this.primary ,this.scroll = true,
   this.extendedTop = true}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      primary: primary,
      physics: scroll? const ScrollPhysics(): const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          extendedTop? dimens.extendSizeBodyBehindAppBar.verticalBoxPadding(): dimens.kDefault.verticalBoxPadding(),
          child,
          extendedBottom ?dimens.k50.verticalBoxPadding(): dimens.kDefault.verticalBoxPadding(),
        ],
      ),
    );
  }
}
