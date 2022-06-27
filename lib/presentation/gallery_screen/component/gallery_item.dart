import 'package:flutter/material.dart';
import 'package:ummah/application/core/extensions/extensions.dart';
import 'package:ummah/constant/style/Style.dart';
import 'package:ummah/presentation/base/base_widget.dart';
import 'package:ummah/presentation/widgets/section_box.dart';

class GalleryItem extends BaseStateLessWidget {
   GalleryItem({
    Key? key,
    required this.index,
    this.backgroundColor,
  }) : super(key: key);

  final int index;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return SectionBox(
      shadow: true,
      color: backgroundColor ??  Style.primary,
      child: Center(
        child: CircleAvatar(
          minRadius: 20,
          maxRadius: 20,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          child: Text('$index', style:  context.textTheme.subtitle1),
        ),
      ),
    );
  }
}
