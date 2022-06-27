import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ummah/constant/style/Style.dart';
import 'package:ummah/application/core/extensions/extensions.dart';
import 'package:ummah/presentation/base/base_widget.dart';
import 'package:ummah/presentation/widgets/main_body.dart';
import 'package:ummah/presentation/widgets/section_box.dart';
import 'package:ummah/presentation/widgets/section_title.dart';

class PaidTab extends BaseStateFullWidget {
  PaidTab({Key? key}) : super(key: key);

  @override
  PaidTabState createState() => PaidTabState();
}

class PaidTabState extends State<PaidTab> {
  @override
  Widget build(BuildContext context) {
    return MainBody(
      extendedTop: false,
      extendedBottom: false,
      scroll: true,
      child: Column(
        children: List.generate(
          10,
          (index) => SectionBox(
              width: context.width,
              height: context.getHeight(0.25),
              color: Style.card1,
              margin: EdgeInsets.all(widget.dimens.k5),
              padding: EdgeInsets.symmetric(horizontal: widget.dimens.k8, vertical: widget.dimens.k10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Education',
                    style: context.textTheme.titleLarge?.copyWith(color: Style.primary, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: SectionTitle(
                            autoResize: true,
                            title: 'Challan No',
                            subTitle: '35165436132518',
                            titleStyle: context.textTheme.bodyText2?.copyWith(color: Style.primary),
                            subtitleStyle: context.textTheme.bodyText2,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: SectionTitle(
                            autoResize: true,
                            title: 'Concession',
                            subTitle: 'B',
                            titleStyle: context.textTheme.bodyText2?.copyWith(color: Style.primary),
                            subtitleStyle: context.textTheme.bodyText2,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: SectionTitle(
                            autoResize: true,
                            title: 'Installment',
                            subTitle: '01',
                            titleStyle: context.textTheme.bodyText2?.copyWith(color: Style.primary),
                            subtitleStyle: context.textTheme.bodyText2,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: SectionTitle(
                            autoResize: true,
                            title: 'Due Date',
                            subTitle: '03/06/2022',
                            titleStyle: context.textTheme.bodyText2?.copyWith(color: Style.primary),
                            subtitleStyle: context.textTheme.bodyText2,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: SectionTitle(
                            autoResize: true,
                            title: 'Received Data',
                            subTitle: '01/06/2022',
                            titleStyle: context.textTheme.bodyText2?.copyWith(color: Style.primary),
                            subtitleStyle: context.textTheme.bodyText2,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.topRight,
                          child: SectionBox(
                            height: 70,
                            width: 120,
                            color: Style.primary,
                            child: Stack(
                              clipBehavior: Clip.none, children: [
                                AnimatedPositioned(
                                  duration: const Duration(milliseconds: 350),
                                  left: -20,
                                  child: SectionBox(
                                    padding: EdgeInsets.symmetric(horizontal: widget.dimens.k15, vertical: widget.dimens.k5),
                                    color: Style.accent1,
                                    child: Text(
                                      'Paid Fee',
                                      style: context.textTheme.caption?.copyWith(color: Style.textColor),
                                    ),
                                  ),
                                ),
                              Positioned(
                                left: 0,
                                right: 0,
                                bottom: 8.0,
                                child: AutoSizeText(
                                  widget.utils.symbolText(2500, ''),
                                  textAlign: TextAlign.center,
                                  style: context.textTheme.headline5?.copyWith(color: Style.card1, fontWeight: FontWeight.normal),
                                  minFontSize: 12,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ).toList(),
      ),
    );
  }
}
