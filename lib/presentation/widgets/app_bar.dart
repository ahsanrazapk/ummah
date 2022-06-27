import 'package:flutter/material.dart';
import 'package:ummah/constant/constants.dart';
import 'package:ummah/constant/style/Style.dart';
import 'package:ummah/di/di.dart';
import 'package:ummah/presentation/base/base_widget.dart';

class SectionAppBar extends BaseStateLessWidget implements PreferredSizeWidget {
  final double? elevation;
  final double toolbarHeight;
  final Widget title;
  final Widget? leading;
  final double? titleSpacing;
  final bool automaticallyImplyLeading;
  final bool centerTitle;
  final List<Widget>? action;
  final double? leadingWidth;
  
   SectionAppBar({
    required this.title,
    this.titleSpacing,
    this.elevation = 0.0,
    this.toolbarHeight = 70.0,
    this.automaticallyImplyLeading = false,
    this.centerTitle = false,
    this.leading,
    this.leadingWidth,
    this.action,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: elevation,
      centerTitle: centerTitle,
      toolbarHeight: toolbarHeight,
      automaticallyImplyLeading: automaticallyImplyLeading,
      leading: leading,
      leadingWidth: leadingWidth,
      title: title,
      titleSpacing: titleSpacing,
      actions: action,
      flexibleSpace: Container(
        decoration:  BoxDecoration(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(dimens.k20),
                bottomRight: Radius.circular(dimens.k20)),
            color: Style.accent1),
        child: Container(
          margin:  EdgeInsets.only(bottom: dimens.k5),
          decoration:  BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(dimens.k20),
                  bottomRight: Radius.circular(dimens.k20)),
              color: Style.primary),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}
