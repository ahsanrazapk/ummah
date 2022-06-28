import 'package:flutter/material.dart';
import 'package:ummah/application/core/extensions/extensions.dart';
import 'package:ummah/application/main_config/routes/route_path.dart';
import 'package:ummah/constant/Images/svgs.dart';
import 'package:ummah/constant/constants.dart';
import 'package:ummah/constant/style/Style.dart';
import 'package:ummah/presentation/base/base_widget.dart';
import 'package:ummah/presentation/home/enums/page_index.dart';
import 'package:ummah/presentation/home/model/user_header_model.dart';
import 'package:ummah/presentation/widgets/app_bar.dart';
import 'package:ummah/presentation/widgets/section_horizontal_widget.dart';
import 'package:ummah/presentation/widgets/section_title.dart';

mixin HomeMixin<T extends BaseStateFullWidget> on State<T> {

  late PageController pageController;

  @override
  initState() {
    super.initState();
      pageController = PageController(initialPage: PageIndex.home.index);
  }



  PreferredSizeWidget?  appBar(UserHeaderModel userHeaderModel) => SectionAppBar(
        title: SectionHorizontalWidget(

          firstWidget: CircleAvatar(
              backgroundColor: Style.accent1,
              radius: widget.dimens.k25,
              backgroundImage: NetworkImage(userHeaderModel.profile),
            ),
          secondWidget: SectionTitle(
              title: 'Welcome back',
              subTitle: userHeaderModel.name,
              autoResize: userHeaderModel.name.length> widget.dimens.k25,
              titleStyle: context.textTheme.bodySmall?.copyWith(color: Colors.white),
              subtitleStyle: context.textTheme.headline5?.copyWith(color: Colors.white),
            ),

        ).onTap(() {}),
        toolbarHeight: widget.dimens.toolBarHeight,
        action: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Style.white,
            ),
            onPressed: () async {
              widget.navigator.pushNamed(RoutePath.notify);
            },
          )
        ],
      );

  bottomAppBar(PageIndex currentPage, ValueChanged<PageIndex> onChange) => BottomAppBar(
        notchMargin: 5.0,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: SvgAssets.navGallery(validPageIndex(currentPage, PageIndex.gallery)),
              onPressed: () => onChange(PageIndex.gallery),
            ),
            IconButton(
              icon: SvgAssets.navNotify(
                validPageIndex(currentPage, PageIndex.activity),
              ),
              onPressed: () => onChange(PageIndex.activity),
            ),
            widget.dimens.k10.horizontalBoxPadding(),
            IconButton(
              icon: SvgAssets.navAbout(validPageIndex(currentPage, PageIndex.about)),
              onPressed: () => onChange(PageIndex.about),
            ),
            IconButton(
              icon: SvgAssets.navOff(
                validPageIndex(currentPage, PageIndex.shutdown),
              ),
              onPressed: () => onChange(PageIndex.shutdown),
            ),
          ],
        ),
      );

  Color? validPageIndex(PageIndex currentPage, PageIndex selectPage) =>
      (currentPage == selectPage) ? Style.white : Style.navIconDefaultColor;
}
