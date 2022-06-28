import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:ummah/application/core/failure/failure.dart';
import 'package:ummah/application/network/error_handler/error_handler.dart';
import 'package:ummah/constant/constants.dart';
import 'package:ummah/constant/style/Style.dart';
import 'package:ummah/application/core/extensions/extensions.dart';
import 'package:ummah/di/di.dart';
import 'package:ummah/presentation/base/base_widget.dart';
import 'package:ummah/presentation/exam_result/exam_result_view_model.dart';
import 'package:ummah/presentation/exam_result/mixin/exam_result__base_mixin.dart';
import 'package:ummah/presentation/exam_result/model/marks_sheet_local.dart';
import 'package:ummah/presentation/exam_result/model/type_index.dart';
import 'package:ummah/presentation/exam_result/pages/test_wise_result/test_wise_result_view_model.dart';
import 'package:ummah/presentation/widgets/main_body.dart';
import 'package:ummah/presentation/widgets/section_box.dart';
import 'mixin/test_wise_result_mixin.dart';

class TestWiseResult extends BaseStateFullWidget {
  TestWiseResult({Key? key}) : super(key: key);

  @override
  TestWiseResultState createState() => TestWiseResultState();
}

class TestWiseResultState extends State<TestWiseResult> with ExamResultBaseMixin, TestWiseResultMixin {
  final ExamResultViewModel _viewModel = inject<ExamResultViewModel>();

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<TestWiseResultViewModel>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar('Test Wise Result', widget.dimens.toolBarHeight, () {
        widget.navigator.pop();
      }),
      body: StreamBuilder(
          stream: _viewModel.testWiseResultStream,
          builder: (context, AsyncSnapshot<Map<TypeIndex, List<MarksSheetLocal>>> snapshot) {
            if (snapshot.hasError) {
              String content = ErrorMessage.fromError(snapshot.error as Failure).message.toString();
              return Center(
                child: Text(content),
              );
            }
            if (snapshot.hasData && snapshot.data != null) {
              final data = snapshot.requireData;
              final tabs = data.keys.toList();
              final pages = data.values.toList();
              return Column(
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
                                    children: tabs.map((e) => SectionBox(
                                      width: widget.dimens.k100,
                                      height: widget.dimens.k50,
                                      color: Style.card1,
                                      border: true,
                                      child: Center(
                                          child: Text(
                                            e.name,
                                            style: context.textTheme.bodyText1?.copyWith(color: Style.primary),
                                          )),
                                    ).onTap(() {onTabTap(e.index);})).toList()),
                                AnimatedPositioned(
                                    left: viewModel.currentIndex * widget.dimens.k110,
                                    child: SectionBox(
                                      width: widget.dimens.k100,
                                      height: widget.dimens.k50,
                                      color: Style.primary,
                                      child: Center(
                                          child: Text(
                                        tabs[viewModel.currentIndex].name,
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
                    children: pages.map((e) => MainBody(
                      scroll: true,
                      extendedBottom: false,
                      extendedTop: false,
                      child: Column(
                        children: [
                          widget.dimens.k10.verticalBoxPadding(),
                          Wrap(
                            children: e.map((sub) => SectionBox(
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
                                    sub.subject,
                                    style: context.textTheme.titleSmall?.copyWith(
                                        color: Style.primary, fontWeight: FontWeight.bold),
                                  ),
                                  SectionBox(
                                      color: Style.accent1,
                                      margin: EdgeInsets.zero,
                                      padding: const EdgeInsets.all(3),
                                      child: Text.rich(TextSpan(
                                          text: '${sub.obtainedMarks}/${sub.totalMarks}',
                                          style: context.textTheme.caption?.copyWith(
                                              color: Style.primary, fontWeight: FontWeight.w500),
                                          children: [
                                            TextSpan(
                                                text: '(${sub.percentage}%)',
                                                style: context.textTheme.caption
                                                    ?.copyWith(color: Style.textColor))
                                          ])))
                                ],
                              ),
                            )).toList(),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: widget.dimens.k15),
                            child: Text(
                              '* Graph values are in percentage',
                              style: context.textTheme.bodyText1?.copyWith(color: Style.red),
                            ),
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
                              series: <ChartSeries<MarksSheetLocal, String>>[
                                ColumnSeries<MarksSheetLocal, String>(
                                  dataSource: e,
                                  //dataLabelSettings: const DataLabelSettings(isVisible: true),
                                  xValueMapper: (MarksSheetLocal data, _) => data.subject,
                                  yValueMapper: (MarksSheetLocal data, _) => data.obtainedMarks,
                                  pointColorMapper: (MarksSheetLocal data, _) =>
                                  data.obtainedMarks < 40 ? Style.red : Style.primary,
                                ),
                               /* ColumnSeries<ChartData, String>(
                                  dataSource: chartData,
                                  //dataLabelSettings: const DataLabelSettings(isVisible: true),
                                  xValueMapper: (ChartData data, _) => data.x,
                                  yValueMapper: (ChartData data, _) => data.y1,
                                  pointColorMapper: (ChartData data, _) =>
                                  data.y1! < 40 ? Style.red : Style.accent1,
                                )*/
                              ])
                        ],
                      ),
                    )).toList(),
                  ))
                ],
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
