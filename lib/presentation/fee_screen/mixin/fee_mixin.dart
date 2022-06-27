
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:ummah/constant/style/Style.dart';
import 'package:ummah/presentation/base/base_widget.dart';
import 'package:ummah/presentation/widgets/app_bar.dart';

mixin FeeMixin<T extends BaseStateFullWidget> on State<T> implements TickerProvider {
  late TabController tabController;
  Ticker? _ticker;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Ticker createTicker(TickerCallback onTick) {
    _ticker = Ticker(onTick);
    return _ticker!;
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  PreferredSizeWidget?  appBar() => SectionAppBar(
    title: const Text('Fee'),
    centerTitle: true,
    toolbarHeight: widget.dimens.toolBarHeight,
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: Style.white,
      ),
      onPressed: (){
        widget.navigator.pop();
      },
    ),
    action: [
      IconButton(
        icon: const Icon(
          Icons.more_vert_rounded,
          color: Style.white,
        ),
        onPressed: () {},
      )
    ],
  );

}