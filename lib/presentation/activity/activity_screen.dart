import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:ummah/constant/Images/svgs.dart';
import 'package:ummah/constant/constants.dart';
import 'package:ummah/constant/style/Style.dart';
import 'package:ummah/application/core/extensions/extensions.dart';
import 'package:ummah/presentation/base/base_widget.dart';
import 'package:ummah/presentation/widgets/main_body.dart';
import 'package:ummah/presentation/widgets/section_big_title_icon.dart';
import 'package:ummah/presentation/widgets/section_box.dart';
import 'package:ummah/presentation/widgets/section_horizontal_widget.dart';
import 'package:ummah/presentation/widgets/section_vertical_widget.dart';

import 'mixin/activity_mixin.dart';

class ActivityScreen extends BaseStateFullWidget {
  ActivityScreen({Key? key}) : super(key: key);

  @override
  ActivityScreenState createState() => ActivityScreenState();
}

class ActivityScreenState extends State<ActivityScreen> with ActivityMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar(),
      body: MainBody(
        child: Column(
          children: List.generate(
              10,
              (index) => SectionBox(
                    width: context.width,
                    height: 180,
                    color: Style.card1,
                    child: SectionHorizontalWidget(
                      firstWidget: SectionBox(
                        width: context.width / 2.5,
                        height: 180,
                        color: Style.primary,
                        child: Container(),
                      ),
                      secondWidget: Center(
                        child: SectionBox(
                          color: Colors.transparent,
                          padding: EdgeInsets.symmetric(vertical: widget.dimens.k25),
                          child: SectionVerticalWidget(
                            firstWidget: Text(
                              'Sports Day',
                              style: context.textTheme.titleLarge
                                  ?.copyWith(color: Style.primary, fontWeight: FontWeight.bold),
                            ),
                            secondWidget: SectionVerticalWidget(
                              firstWidget: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [SectionHorizontalWidget(firstWidget: SvgAssets.clock, secondWidget: Text(
                                  'Time ',
                                  style: context.textTheme.caption
                                      ?.copyWith(color: Style.fontGrey, fontWeight: FontWeight.normal),
                                ),),widget.dimens.k8.horizontalBoxPadding(),Text(
                                  '02:00 Pm',
                                  style: context.textTheme.caption
                                      ?.copyWith(color: Style.fontGrey, fontWeight: FontWeight.normal),
                                ), ],
                              ),
                              secondWidget: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [SectionHorizontalWidget(firstWidget: SvgAssets.cal, secondWidget: Text(
                                  'Data',
                                  style: context.textTheme.caption
                                      ?.copyWith(color: Style.fontGrey, fontWeight: FontWeight.normal),
                                ),),widget.dimens.k8.horizontalBoxPadding(),Text(
                                  '01 Dec 2021',
                                  style: context.textTheme.caption
                                      ?.copyWith(color: Style.fontGrey, fontWeight: FontWeight.normal),
                                ), ],
                              ),
                              gap: widget.dimens.k15,
                            ),
                            gap: widget.dimens.k25,
                          ),
                        ),
                      ),
                    ),
                  )),
        ),
      ),
    );
  }
}
