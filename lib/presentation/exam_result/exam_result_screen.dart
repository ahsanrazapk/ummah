import 'package:flutter/material.dart';
import 'package:ummah/constant/Images/svgs.dart';
import 'package:ummah/constant/style/Style.dart';
import 'package:ummah/application/core/extensions/extensions.dart';
import 'package:ummah/application/main_config/routes/route_path.dart';
import 'package:ummah/di/di.dart';
import 'package:ummah/presentation/base/base_widget.dart';
import 'package:ummah/presentation/exam_result/exam_result_view_model.dart';
import 'package:ummah/presentation/exam_result/mixin/exam_result__base_mixin.dart';
import 'package:ummah/presentation/widgets/main_body.dart';
import 'package:ummah/presentation/widgets/section_box.dart';

class ExamResultScreen extends BaseStateFullWidget {
  ExamResultScreen({Key? key}) : super(key: key);

  @override
  ExamResultScreenState createState() => ExamResultScreenState();
}

class ExamResultScreenState extends State<ExamResultScreen> with ExamResultBaseMixin {

  final ExamResultViewModel _viewModel = inject<ExamResultViewModel>();

  @override
  void initState() {
  _viewModel.getSubjectWiseResult();
  _viewModel.getTestWiseResult();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: appBar('Exam Result',widget.dimens.toolBarHeight, (){
        widget.navigator.pop();
      }),
      body: MainBody(
        extendedBottom: false,
        child: Column(
          children: [
            SectionBox(
                color: Style.primary,
                width: context.width,
                height: context.getHeight(0.25),
                padding: EdgeInsets.all(widget.dimens.k15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Overall\nResult',
                      style: context.textTheme.headline5
                          ?.copyWith(color: Style.card1.withOpacity(0.6), fontWeight: FontWeight.w400),
                    ),
                    SvgAssets.or,
                  ],
                )).onTap(() {
                  widget.navigator.pushNamed(RoutePath.overallResult);
            }),
            SectionBox(
                color: Style.primary,
                width: context.width,
                height: context.getHeight(0.25),
                padding: EdgeInsets.all(widget.dimens.k15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Subject Wise\nResult',
                      style: context.textTheme.headline5
                          ?.copyWith(color: Style.card1.withOpacity(0.6), fontWeight: FontWeight.w400),
                    ),
                    SvgAssets.swr,
                  ],
                )).onTap(() {
              widget.navigator.pushNamed(RoutePath.subjectWiseResult);
            }),
            SectionBox(
                color: Style.primary,
                width: context.width,
                height: context.getHeight(0.25),
                padding: EdgeInsets.all(widget.dimens.k15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Test Wise\nResult',
                      style: context.textTheme.headline5
                          ?.copyWith(color: Style.card1.withOpacity(0.6), fontWeight: FontWeight.w400),
                    ),
                    SvgAssets.twr,
                  ],
                )).onTap(() {
              widget.navigator.pushNamed(RoutePath.testWiseResult);
            })
          ],
        ),
      ),
    );
  }
}
