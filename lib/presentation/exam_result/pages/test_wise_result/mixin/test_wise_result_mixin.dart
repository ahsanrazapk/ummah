import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ummah/presentation/base/base_widget.dart';
import 'package:ummah/presentation/exam_result/pages/test_wise_result/test_wise_result_view_model.dart';

mixin TestWiseResultMixin<T extends BaseStateFullWidget> on State<T> {

  PageController controller = PageController(
    initialPage: 0,
  );
  ScrollController scrollController = ScrollController();


 void onPageChange(index) {
  setState(() {
  context.read<TestWiseResultViewModel>().currentIndex = index;
  });
  scrollController.animateTo(widget.dimens.k100 * index,
  duration: kTabScrollDuration, curve: Curves.ease);
  }

  void onTabTap(index){
    context.read<TestWiseResultViewModel>().currentIndex = index;
    controller.animateToPage(index,
        duration: kTabScrollDuration, curve: Curves.ease);
  }


  @override
  void dispose() {
  controller.dispose();
  scrollController.dispose();
    super.dispose();
  }
}