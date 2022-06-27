import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:ummah/application/core/extensions/extensions.dart';
import 'package:ummah/constant/Images/svgs.dart';
import 'package:ummah/constant/constants.dart';
import 'package:ummah/constant/style/Style.dart';
import 'package:ummah/presentation/about_screen/mixin/about_mixin.dart';
import 'package:ummah/presentation/base/base_widget.dart';
import 'package:ummah/presentation/gallery_screen/component/gallery_item.dart';
import 'package:ummah/presentation/gallery_screen/mixin/gallery_mixin.dart';
import 'package:ummah/presentation/widgets/main_body.dart';
import 'package:ummah/presentation/widgets/section_box.dart';

class AboutScreen extends BaseStateFullWidget {
  AboutScreen({Key? key}) : super(key: key);

  @override
  AboutScreenState createState() => AboutScreenState();
}

class AboutScreenState extends State<AboutScreen> with AboutMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(preferredSize: const Size.fromHeight(150),
      child: Stack(
        alignment: const Alignment(0.0, 4.3),
        children: [
          Center(child: appBar(widget.dimens, widget.navigator)),
          Material(
            elevation: 4.0,
            borderRadius: BorderRadius.circular(100),
            child: CircleAvatar(radius: 70,backgroundColor: Colors.white,child:
            CircleAvatar(
                radius: 60,
                backgroundColor: Style.card1,
                child: SvgAssets.appLogoBlueSmall,
            ),),
          ),
        ],
      )),
      body: MainBody(
        scroll: true,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            (140.0).verticalBoxPadding(),
            SectionBox(padding: EdgeInsets.symmetric(horizontal: widget.dimens.k8),color: Style.primary, child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text(
              'Our Story',
              style: context.textTheme.titleLarge
                  ?.copyWith(color: Style.white, fontWeight: FontWeight.normal),
            ), SvgAssets.forwardWhite],), height: widget.dimens.k50,width: context.width,),
             SectionBox(padding: EdgeInsets.symmetric(horizontal: widget.dimens.k8),color: Style.primary, child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text(
              'CEO\'s Message',
              style: context.textTheme.titleLarge
                  ?.copyWith(color: Style.white, fontWeight: FontWeight.normal),
            ), SvgAssets.forwardWhite],), height: widget.dimens.k50,width: context.width,),
             SectionBox(padding: EdgeInsets.symmetric(horizontal: widget.dimens.k8),color: Style.primary, child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text(
              'Our Values',
              style: context.textTheme.titleLarge
                  ?.copyWith(color: Style.white, fontWeight: FontWeight.normal),
            ), SvgAssets.forwardWhite],), height: widget.dimens.k50,width: context.width,),
             SectionBox(padding: EdgeInsets.symmetric(horizontal: widget.dimens.k8),color: Style.primary, child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [Text(
              'Visit Our Website',
              style: context.textTheme.titleLarge
                  ?.copyWith(color: Style.white, fontWeight: FontWeight.normal),
            ), SvgAssets.forwardWhite],), height: widget.dimens.k50,width: context.width,),
            widget.dimens.k10.verticalBoxPadding(),
            Center(child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [SvgAssets.fb, SvgAssets.insta, SvgAssets.tw],))
          ],
        ),
      ),
    );
  }
}

