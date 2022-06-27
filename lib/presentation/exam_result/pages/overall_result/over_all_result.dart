import 'package:flutter/material.dart';
import 'package:ummah/constant/style/Style.dart';
import 'package:ummah/application/core/extensions/extensions.dart';
import 'package:ummah/presentation/base/base_widget.dart';
import 'package:ummah/presentation/exam_result/mixin/exam_result__base_mixin.dart';
import 'package:ummah/presentation/exam_result/pages/overall_result/mixin/overall_result_mixin.dart';
import 'package:ummah/presentation/exam_result/pages/overall_result/tabs/subject_report.dart';
import 'package:ummah/presentation/exam_result/pages/overall_result/tabs/test_report.dart';
import 'package:ummah/presentation/utils/utils.dart';
import 'package:ummah/presentation/widgets/main_body.dart';
import 'package:ummah/presentation/widgets/section_box.dart';
import 'package:ummah/services/navService/INavigationService.dart';

class OverAllResult extends BaseStateFullWidget {
  OverAllResult({Key? key}) : super(key: key);

  @override
  OverAllResultState createState() => OverAllResultState();
}

class OverAllResultState extends State<OverAllResult> with OverallResultMixin, ExamResultBaseMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Overall Result', widget.dimens.toolBarHeight, () {
        widget.navigator.pop();
      }),
      body: Column(
        children: [
          SectionBox(
            height: context.getHeight(0.10),
            color: Style.card1,
            child: Padding(
              padding: EdgeInsets.all(widget.dimens.k5),
              child: TabBar(
                controller: tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(widget.dimens.k10),
                  color: Style.primary,
                ),
                labelColor: Style.card1,
                unselectedLabelColor: Style.primary,
                tabs: const [
                  Tab(
                    text: 'Test Report',
                  ),
                  Tab(
                    text: 'Subject Report',
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: SectionBox(
              width: context.width,
              color: Colors.transparent,
              child: TabBarView(
                controller: tabController,
                children: [TestReport(), SubjectReport()],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
