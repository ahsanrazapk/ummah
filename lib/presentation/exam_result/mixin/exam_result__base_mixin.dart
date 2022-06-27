import 'package:flutter/material.dart';
import 'package:ummah/constant/style/Style.dart';
import 'package:ummah/presentation/widgets/app_bar.dart';

mixin ExamResultBaseMixin {

  PreferredSizeWidget?  appBar(String title, double toolbarHeight, VoidCallback onPressed) => SectionAppBar(
        title: Text(title),
        centerTitle: true,
        toolbarHeight: toolbarHeight,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Style.white,
          ),
          onPressed: onPressed,
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
