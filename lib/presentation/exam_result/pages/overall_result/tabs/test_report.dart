import 'package:flutter/material.dart';
import 'package:ummah/constant/style/Style.dart';
import 'package:ummah/application/core/extensions/extensions.dart';
import 'package:ummah/presentation/base/base_widget.dart';
import 'package:ummah/presentation/widgets/section_big_title_icon.dart';
import 'package:ummah/presentation/widgets/section_box.dart';

class TestReport extends BaseStateFullWidget {
   TestReport({Key? key}) : super(key: key);

  @override
  _TestReportState createState() => _TestReportState();
}

class _TestReportState extends State<TestReport> {
  @override
  Widget build(BuildContext context) {
    final padding = EdgeInsets.all(widget.dimens.k8);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: widget.dimens.k15),
          child: SectionBigTitleWithIcon(
              title: 'Metric',
              titleStyle: context.textTheme.bodyMedium?.copyWith(color: Style.textColor),
              icon: Container(width: 10, height: 10, color: Style.accent1)),
        ),
        SectionBox(
            width: context.width,
            height: context.getHeight(0.08),
            color: Colors.transparent,
            margin: EdgeInsets.fromLTRB(widget.dimens.k5, widget.dimens.k5, widget.dimens.k5, widget.dimens.kDefault),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: padding,
                  child: Text(
                    'Title',
                    style: context.textTheme.titleSmall?.copyWith(color: Style.primary, fontWeight: FontWeight.w400),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: padding,
                      child: Text(
                        'Out of',
                        style: context.textTheme.titleSmall?.copyWith(color: Style.primary),
                      ),
                    ),
                    Padding(
                      padding: padding,
                      child: Text(
                        'Marks',
                        style: context.textTheme.titleSmall?.copyWith(color: Style.primary),
                      ),
                    ),
                    Padding(
                      padding: padding,
                      child: Text(
                        'Grade',
                        style: context.textTheme.titleSmall?.copyWith(color: Style.primary),
                      ),
                    )
                  ],
                )
              ],
            )),
        Expanded(
          child: SingleChildScrollView(
            primary: true,
            child: Column(
              children: [
                ...List.generate(
                  10,
                      (index) => SectionBox(
                      width: context.width,
                      height: context.getHeight(0.11),
                      color: Style.card1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: padding,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Eng -01',
                                  style: context.textTheme.titleLarge
                                      ?.copyWith(color: Style.primary, fontWeight: FontWeight.bold),
                                ),
                                SectionBox(
                                    color: Style.accent1,
                                    margin: EdgeInsets.only(top: widget.dimens.k5),
                                    padding: const EdgeInsets.fromLTRB(4, 3, 4, 3),
                                    child: Text.rich(TextSpan(
                                        text: '134/150',
                                        style: context.textTheme.caption
                                            ?.copyWith(color: Style.primary, fontWeight: FontWeight.w500),
                                        children: [
                                          TextSpan(
                                              text: '(90.35%)',
                                              style: context.textTheme.caption?.copyWith(color: Style.textColor))
                                        ])))
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: padding,
                                child: Text(
                                  '150',
                                  style: context.textTheme.titleSmall?.copyWith(color: Style.primary),
                                ),
                              ),
                              Padding(
                                  padding: padding,
                                  child: Text.rich(
                                    TextSpan(
                                        text: '150',
                                        style: context.textTheme.titleSmall?.copyWith(color: Style.primary),
                                        children: [
                                          TextSpan(
                                              text: '(90.35%)',
                                              style: context.textTheme.labelSmall
                                                  ?.copyWith(color: Style.textColor, letterSpacing: 0.0))
                                        ]),
                                  )),
                              Padding(
                                padding: padding,
                                child: Text('B+', style: context.textTheme.titleSmall?.copyWith(color: Style.primary)),
                              )
                            ],
                          )
                        ],
                      )),
                ).toList(),
              ],
            ),
          ),
        ),
        SectionBox(
            width: context.width,
            height: context.getHeight(0.12),
            color: Style.primary,
            margin: EdgeInsets.fromLTRB(widget.dimens.k5, widget.dimens.kDefault, widget.dimens.k5, widget.dimens.k5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: padding,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total',
                        style: context.textTheme.titleLarge?.copyWith(color: Style.white, fontWeight: FontWeight.bold),
                      ),
                      SectionBox(
                          color: Style.accent1,
                          margin: EdgeInsets.only(top: widget.dimens.k5),
                          padding: const EdgeInsets.fromLTRB(4, 3, 4, 3),
                          child: Text.rich(TextSpan(
                              text: '134/150',
                              style: context.textTheme.caption
                                  ?.copyWith(color: Style.primary, fontWeight: FontWeight.w500),
                              children: [
                                TextSpan(
                                    text: '(90.35%)',
                                    style: context.textTheme.caption?.copyWith(color: Style.textColor))
                              ])))
                    ],
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: padding,
                      child: Text(
                        '150',
                        style: context.textTheme.titleMedium?.copyWith(color: Style.white, fontWeight: FontWeight.w900),
                      ),
                    ),
                    Padding(
                        padding: padding,
                        child: Text.rich(
                          TextSpan(
                              text: '150',
                              style: context.textTheme.titleMedium
                                  ?.copyWith(color: Style.white, fontWeight: FontWeight.w900),
                              children: [
                                TextSpan(
                                    text: '(90.35%)',
                                    style:
                                    context.textTheme.labelMedium?.copyWith(color: Style.white, letterSpacing: 0.0))
                              ]),
                        )),
                    Padding(
                      padding: padding,
                      child: Text('B+',
                          style:
                          context.textTheme.titleMedium?.copyWith(color: Style.white, fontWeight: FontWeight.w900)),
                    )
                  ],
                )
              ],
            ))
      ],
    );
  }
}
