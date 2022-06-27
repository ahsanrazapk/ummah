import 'package:flutter/material.dart';
import 'package:ummah/constant/style/Style.dart';
import 'package:ummah/application/core/extensions/extensions.dart';
import 'package:ummah/presentation/base/base_widget.dart';
import 'package:ummah/presentation/exam_result/mixin/exam_result__base_mixin.dart';
import 'package:ummah/presentation/exam_result/pages/overall_result/mixin/overall_result_mixin.dart';
import 'package:ummah/presentation/exam_result/pages/overall_result/tabs/subject_report.dart';
import 'package:ummah/presentation/exam_result/pages/overall_result/tabs/test_report.dart';
import 'package:ummah/presentation/fee_screen/mixin/fee_mixin.dart';
import 'package:ummah/presentation/fee_screen/tabs/fee_paid.dart';
import 'package:ummah/presentation/fee_screen/tabs/fee_unpaid.dart';
import 'package:ummah/presentation/utils/utils.dart';
import 'package:ummah/presentation/widgets/main_body.dart';
import 'package:ummah/presentation/widgets/section_box.dart';
import 'package:ummah/services/navService/INavigationService.dart';

class FeeScreen extends BaseStateFullWidget {
  FeeScreen({Key? key}) : super(key: key);

  @override
  OverAllResultState createState() => OverAllResultState();
}

class OverAllResultState extends State<FeeScreen> with FeeMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
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
                    text: 'Paid',
                  ),
                  Tab(
                    text: 'Unpaid',
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
                children: [PaidTab(), UnPaidTab()],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
