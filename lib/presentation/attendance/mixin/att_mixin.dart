import 'package:flutter/material.dart';
import 'package:ummah/constant/style/Style.dart';
import 'package:ummah/presentation/base/base_widget.dart';
import 'package:ummah/presentation/widgets/app_bar.dart';

mixin AttendanceMixin<T extends BaseStateFullWidget> on State<T> {

  PreferredSizeWidget?  appBar() => SectionAppBar(
        title:const Text('Attendance'),
        centerTitle: true,
        toolbarHeight: widget.dimens.toolBarHeight,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Style.white,
          ),
          onPressed: () {
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
