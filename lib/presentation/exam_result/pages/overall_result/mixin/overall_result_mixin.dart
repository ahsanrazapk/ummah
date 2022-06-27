
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:ummah/presentation/base/base_widget.dart';

mixin OverallResultMixin<T extends BaseStateFullWidget> on State<T> implements TickerProvider {
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
}