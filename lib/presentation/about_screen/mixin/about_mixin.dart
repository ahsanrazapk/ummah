import 'package:flutter/material.dart';
import 'package:ummah/constant/constants.dart';
import 'package:ummah/constant/style/Style.dart';
import 'package:ummah/presentation/widgets/app_bar.dart';
import 'package:ummah/services/navService/INavigationService.dart';

mixin AboutMixin {

  PreferredSizeWidget?  appBar(Px dimens, INavigationService navigator) => SectionAppBar(
    title: const Text('About'),
    centerTitle: true,
    toolbarHeight: 100,
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: Style.white,
      ),
      onPressed: (){
        navigator.pop();
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