import 'package:flutter/material.dart';
import 'package:ummah/application/core/extensions/extensions.dart';
import 'package:ummah/constant/style/Style.dart';
import 'package:ummah/application/main_config/routes/route_path.dart';
import 'package:ummah/data/models/login_response.dart';
import 'package:ummah/presentation/base/base_mixin.dart';
import 'package:ummah/presentation/widgets/section_box.dart';

class MySliverAppBar extends SliverPersistentHeaderDelegate with BaseMixin {
  final double expandedHeight;
  final bool actionDone;
  final LoginData loginData;

  MySliverAppBar({required this.expandedHeight, required this.actionDone, required this.loginData});

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    double opacity = shrinkOffset / expandedHeight;
    return Container(
      color: Style.primary.withOpacity(opacity),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
              opacity: (1 - opacity),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 4,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        const CircleAvatar(
                          radius: 80,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                              radius: 70, backgroundImage: NetworkImage("https://via.placeholder.com/200x200")),
                        ),
                        SectionBox(
                          color: Style.primary,
                          padding: EdgeInsets.symmetric(horizontal: dimens.k8, vertical: dimens.k5),
                          margin: EdgeInsets.zero,
                          radius: dimens.k20,
                          child: Text(
                            utils.compactText(loginData.classData?.name),
                            style: context.textTheme.titleSmall?.copyWith(color: Style.card1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical: dimens.k5),
                    child: Opacity(
                      opacity: (1 - opacity),
                      child: Text(
                        'Muhammad Ahsan Raza',
                        style: context.textTheme.headline6
                            ?.copyWith(color: Style.primary, fontWeight: FontWeight.normal, fontSize: 22),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text.rich(TextSpan(
                        text: 'REG No. ',
                        style: context.textTheme.titleMedium
                            ?.copyWith(color: Style.textColor, fontWeight: FontWeight.w500),
                        children: [
                          TextSpan(
                              text: utils.compactText(loginData.regNo),
                              style: context.textTheme.titleMedium
                                  ?.copyWith(color: Style.textColor, fontWeight: FontWeight.normal)),
                          const TextSpan(
                              text: '\n'),
                          TextSpan(
                              text: 'ROLL No. ',
                              style: context.textTheme.titleMedium
                                  ?.copyWith(color: Style.textColor, fontWeight: FontWeight.w500),
                              children: [
                                TextSpan(
                                    text: utils.compactText(loginData.rollNo),
                                    style: context.textTheme.titleMedium
                                        ?.copyWith(color: Style.textColor, fontWeight: FontWeight.normal))
                              ])
                        ])),
                  ),
                ],
              )),
          Positioned(
            left: 0,
            top: 0,
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: (opacity) > 0.5 ? Colors.white.withOpacity(opacity) : Style.primary.withOpacity((1 - opacity)),
              ),
              onPressed: () {
                navigator.pop();
              },
            ),
          ),
          Positioned(
            right: 0,
            top: 0,
            child: actionDone
                ? IconButton(
                    constraints: BoxConstraints(minWidth: dimens.k60, minHeight: kToolbarHeight),
                    icon: Center(
                      child: Text(
                        'Done',
                        style: context.textTheme.titleMedium?.copyWith(
                          color: (opacity) > 0.5
                              ? Colors.white.withOpacity(opacity)
                              : Style.primary.withOpacity((1 - opacity)),
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    onPressed: () {
                      navigator.pop();
                    },
                  )
                : IconButton(
                    icon: Icon(
                      Icons.settings,
                      color: (opacity) > 0.5
                          ? Colors.white.withOpacity(opacity)
                          : Style.primary.withOpacity((1 - opacity)),
                    ),
                    onPressed: () {
                      navigator.pushNamed(RoutePath.editProfile, object: loginData);
                    },
                  ),
          ),
          Opacity(
            opacity: opacity,
            child: Center(
              child: Text(
                'Muhammad Ahsan Raza',
                style: context.textTheme.headline6
                    ?.copyWith(color: Style.white, fontWeight: FontWeight.normal, fontSize: 22),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
/*
position: Tween<Offset>(begin:   Offset(0.0, -(opacity)), end:  Offset.zero)
.animate(controller),*/
