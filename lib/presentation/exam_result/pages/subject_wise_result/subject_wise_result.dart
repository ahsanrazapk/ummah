import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:ummah/constant/constants.dart';
import 'package:ummah/constant/style/Style.dart';
import 'package:ummah/application/core/extensions/extensions.dart';
import 'package:ummah/presentation/base/base_widget.dart';
import 'package:ummah/presentation/exam_result/mixin/exam_result__base_mixin.dart';
import 'package:ummah/presentation/exam_result/pages/subject_wise_result/subject_wise_result_view_model.dart';
import 'package:ummah/presentation/home/model/ChartData.dart';
import 'package:ummah/presentation/widgets/main_body.dart';
import 'package:ummah/presentation/widgets/section_box.dart';
import '../overall_result/mixin/overall_result_mixin.dart';
import 'mixin/subject_wise_result_mixin.dart';

class SubjectWiseResult extends BaseStateFullWidget {
  SubjectWiseResult({Key? key}) : super(key: key);

  @override
  SubjectWiseResultState createState() => SubjectWiseResultState();
}

class SubjectWiseResultState extends State<SubjectWiseResult> with ExamResultBaseMixin , SubjectWiseResultMixin {
  final List<ChartData> chartData = [
    ChartData('ABC-01', 80, Style.primary),
    ChartData('ABC-02', 70, Style.primary),
    ChartData('ABC-03', 90, Style.primary),
    ChartData('ABC-04', 30, Style.primary),
    ChartData('ABC-05', 50, Style.primary),
    ChartData('ABC-06', 20, Style.primary),
    ChartData('ABC-07', 70, Style.primary),
    ChartData('ABC-08', 45, Style.primary),
  ];

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SubjectWiseResultViewModel>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar('Subject Wise Result', widget.dimens.toolBarHeight, () {
        widget.navigator.pop();
      }),
      body: Column(
        children: [
          SectionBox(
              height: widget.dimens.extendSizeBodyBehindAppBar + (widget.dimens.k80),
              width: context.width,
              color: Style.card1,
              margin: EdgeInsets.zero,
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(top: widget.dimens.extendSizeBodyBehindAppBar),
                  child: SingleChildScrollView(
                    controller: scrollController,
                    scrollDirection: Axis.horizontal,
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Row(
                            children: List.generate(
                                10,
                                (index) => SectionBox(
                                      width: widget.dimens.k100,
                                      height: widget.dimens.k50,
                                      color: Style.card1,
                                      border: true,
                                      child: Center(
                                          child: Text(
                                        '$index',
                                        style: context.textTheme.bodyText1?.copyWith(color: Style.primary),
                                      )),
                                    ).onTap(() {
                                      onTabTap(index);
                                    })).toList()),
                        AnimatedPositioned(
                            left: viewModel.currentIndex * widget.dimens.k110,
                            child: SectionBox(
                              width: widget.dimens.k100,
                              height: widget.dimens.k50,
                              color: Style.primary,
                              child: Center(
                                  child: Text(
                                '${viewModel.currentIndex}',
                                style: context.textTheme.bodyText1?.copyWith(color: Style.card1),
                              )),
                            ),
                            duration: kTabScrollDuration,
                            curve: Curves.ease)
                      ],
                    ),
                  ),
                ),
              )),
          Expanded(
            child: PageView(
                  controller: controller,
                  physics: const AlwaysScrollableScrollPhysics(),
                  onPageChanged: onPageChange,
                  children: List.generate(
                      10,
                      (index) => FutureBuilder(
                        future:  Future.value(Future.delayed(const Duration(seconds: 2),()=> true)),
                        builder: (context, snapshot) {
                          if(snapshot.hasData) {
                            return MainBody(
                              scroll: true,
                              extendedBottom: false,
                              extendedTop: false,
                              child: Column(
                                children: [
                                  widget.dimens.k10.verticalBoxPadding(),
                                  Wrap(
                                    children: List.generate(
                                        8,
                                            (index) =>
                                            SectionBox(
                                              color: Style.card1,
                                              height: 55,
                                              padding: EdgeInsets.fromLTRB(
                                                  widget.dimens.k5, widget.dimens.k5, widget.dimens.k5, 3),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Text(
                                                    'English',
                                                    style: context.textTheme.titleSmall
                                                        ?.copyWith(color: Style.primary, fontWeight: FontWeight.bold),
                                                  ),
                                                  SectionBox(
                                                      color: Style.accent1,
                                                      margin: EdgeInsets.zero,
                                                      padding: const EdgeInsets.all(3),
                                                      child: Text.rich(TextSpan(
                                                          text: '134/150',
                                                          style: context.textTheme.caption
                                                              ?.copyWith(color: Style.primary, fontWeight: FontWeight.w500),
                                                          children: [
                                                            TextSpan(
                                                                text: '(90.35%)',
                                                                style: context.textTheme.caption
                                                                    ?.copyWith(color: Style.textColor))
                                                          ])))
                                                ],
                                              ),
                                            )).toList(),
                                  ),
                                  Padding(
                                    padding:  EdgeInsets.symmetric(vertical:widget.dimens.k15),
                                    child: Text('* Graph values are in percentage', style: context.textTheme.bodyText1?.copyWith(color: Style.red),),
                                  ),
                                  SfCartesianChart(
                                      primaryXAxis: CategoryAxis(
                                          majorGridLines: const MajorGridLines(width: 0),
                                          labelStyle: context.textTheme.caption?.copyWith(color: Style.textColor),
                                          interval: 1,
                                          labelRotation: 20,
                                          majorTickLines: const MajorTickLines(width: 0)),
                                      primaryYAxis: NumericAxis(
                                          minimum: 0,
                                          maximum: 100,
                                          interval: 10,
                                          majorGridLines: const MajorGridLines(width: 0),
                                          majorTickLines: const MajorTickLines(width: 0)),
                                      plotAreaBorderWidth: widget.dimens.kDefault,
                                      series: <ChartSeries<ChartData, String>>[
                                        ColumnSeries<ChartData, String>(
                                          dataSource: chartData,
                                          //dataLabelSettings: const DataLabelSettings(isVisible: true),
                                          xValueMapper: (ChartData data, _) => data.x,
                                          yValueMapper: (ChartData data, _) => data.y,
                                          pointColorMapper: (ChartData data, _) => data.y < 40 ? Style.red : data.color,
                                        )
                                      ])
                                ],
                              ),
                            );
                          }else{
                            return const Center(child: CircularProgressIndicator(),);
                          }
                        }
                      )).toList(),
                )
          )
        ],
      ),
    );
  }
}

